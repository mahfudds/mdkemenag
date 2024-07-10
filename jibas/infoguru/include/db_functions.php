<?
/**[N]**
 * JIBAS Education Community
 * Jaringan Informasi Bersama Antar Sekolah
 * 
 * @version: 31.0 (Jun 21, 2024)
 * @notes: 
 * 
 * Copyright (C) 2024 JIBAS (http://www.jibas.net)
 * 
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 **[N]**/ ?>
<?
require_once("config.php");
require_once("errorhandler.php");
require_once("dbexception.class.php");

$mysqlconnection = NULL;
$mysqlclosed = false;

//Buka koneksi ke Database
function OpenDb() 
{
	global $db_host, $db_user, $db_pass, $db_name, $mysqlconnection;

    // -- v31 -- 2025-05-26
    // force mysqli to not report any errors
    mysqli_report(MYSQLI_REPORT_OFF);
	
	$mysqlconnection = @mysqli_connect($db_host, $db_user, $db_pass);
	if (!$mysqlconnection)
	{
		HandleQueryError("Tidak dapat terhubung dengan server database JIBAS di $db_host", 
						 mysqli_errno($mysqlconnection), mysqli_error($mysqlconnection), false);
		exit();
	} 
	else 
	{
		$select = @mysqli_select_db($mysqlconnection, $db_name);
		if (!$select)
		{
			HandleQueryError("Tidak dapat membuka database $db_name", 
							 mysqli_errno($mysqlconnection), mysqli_error($mysqlconnection), false);
			exit();
		}
				  
		mysqli_query($mysqlconnection,"SET lc_time_names = 'id_ID';");
		
		return $mysqlconnection;
	}
}	

function OpenDbi() 
{
	global $db_host, $db_user, $db_pass, $db_name, $conni;

	$conni = @mysqli_connect($db_host, $db_user, $db_pass) or trigger_error("Can not connect to database server", E_USER_ERROR);
	$select = @mysqli_select_db($conni, $db_name) or trigger_error("Can not open the database", E_USER_ERROR);
	
	return $conni;
}

//Buat query
function QueryDbi($sql) 
{
	$result = mysqli_query($sql) or trigger_error("Failed to execute sql query: $sql", E_USER_ERROR);
	
	return $result;
}

//Tutup koneksi
function CloseDb() 
{
	global $mysqlconnection;
	global $mysqlclosed;

	if ($mysqlconnection == null)
	    return;

	if ($mysqlclosed)
	    return;
	
	@mysqli_close($mysqlconnection);

	$mysqlclosed = true;
}

function HandleQueryError($sql, $errno, $errmsg, $issend)
{
	// Log Error
	LogError($sql, $errno, $errmsg);
	
	// Error Handler
	session_name("jbsinfoguru");
	session_start();	  	 
	
	$_SESSION['errtype'] = 1; //mysql
	$_SESSION['errfile'] = $_SERVER['SCRIPT_NAME'];			
	$_SESSION['errno'] = $errno;
	$_SESSION['errmsg'] = "Query: $sql<br>ErrNo: $errno<br>Error: $errmsg";
	$_SESSION['issend'] = $issend;
	
	trigger_error("exception", E_USER_ERROR);
}

//Buat query
function QueryDb($sql) 
{
	global $mysqlconnection;
	
	$result = @mysqli_query($mysqlconnection, $sql);
	
	if (mysqli_errno($mysqlconnection) > 0)
	{
		// Save Error Information
		$errmsg = mysqli_error($mysqlconnection);
		$errno = mysqli_errno($mysqlconnection);
		
		// Force Closing Database Connection
		CloseDb();
		
		// Handle Error
		HandleQueryError($sql, $errno, $errmsg, true);
		exit();
	}

	return $result;
}

function QueryDbTrans($sql, &$success) 
{
	global $mysqlconnection;
	
	$result = @mysqli_query($mysqlconnection, $sql);
	$success = ($result && 1); 
	
	if (!$success)
	{
		// Save Error Information
		$errmsg = mysqli_error($mysqlconnection);
		$errno = mysqli_errno($mysqlconnection);
		
		// Force Rolling Back and Closing Database Connection
		RollbackTrans();
		CloseDb();
		
		// Handle Error
		HandleQueryError($sql, $errno, $errmsg, true);
		exit();
	}
	
	return $result;
}

function LogError($sql, $errno, $error)
{
	global $G_ENABLE_QUERY_ERROR_LOG;
	
	if (!$G_ENABLE_QUERY_ERROR_LOG)
		return;
		
	$logPath = @realpath(@dirname(__FILE__)) . "/../../log";
	$logExists = @file_exists($logPath) && @is_dir($logPath);
	if (!$logExists)
		@mkdir($logPath, 0740, true);
	
	$logFile = @realpath(@dirname(__FILE__)) . "/../../log/infoguru-error.log";
	$modeFile = (@file_exists($logFile) && @filesize($logFile) > 1024 * 1024) ? "w" : "a";
	
	$fp = @fopen($logFile, $modeFile);
	@fwrite($fp, "-- Query Error on " . date('d-M-Y H:i:s') . " --------\r\n");
	@fwrite($fp, " SCRIPT > " . $_SERVER['SCRIPT_NAME'] . "\r\n");
	@fwrite($fp, " QUERY  > $sql\r\n");
	@fwrite($fp, " ERRNO  > $errno\r\n");
	@fwrite($fp, " ERROR  > $error\r\n");
	@fwrite($fp, "\r\n");
	@fclose($fp);
}

function BeginTrans() 
{
	global $mysqlconnection;
	
	@mysqli_query($mysqlconnection, "SET AUTOCOMMIT=0");
	@mysqli_query($mysqlconnection, "BEGIN");
}

function CommitTrans() 
{
	global $mysqlconnection;
	
	@mysqli_query($mysqlconnection, "COMMIT");
	@mysqli_query($mysqlconnection,"SET AUTOCOMMIT=1");
}

function RollbackTrans() 
{
	global $mysqlconnection;
	
	@mysqli_query($mysqlconnection,"ROLLBACK");
	@mysqli_query($mysqlconnection,"SET AUTOCOMMIT=1");
}

function GetValue($tablename, $column, $where) 
{
	$sql = "SELECT $column FROM $tablename WHERE $where";
	$result_get_value = QueryDb($sql);
	$row_get_value = mysqli_fetch_row($result_get_value);
	
	return $row_get_value[0];
}

function FetchSingle($sql)
{
	global $mysqlconnection;
	
	$res = QueryDb($sql);
	$row = @mysqli_fetch_row($res);
	return $row[0];
}

function FetchRow($sql)
{
	global $mysqlconnection;
	
	$res = QueryDb($sql);
	$row = @mysqli_fetch_row($res);
	return $row;
}

function QueryDbEx($sql)
{
	global $mysqlconnection;
		
    $result = @mysqli_query($mysqlconnection, $sql);
	LogQuery($sql);
	
	if (mysqli_errno($mysqlconnection) > 0)
	{
		LogIfError($sql);
		throw new DbException(mysqli_error($mysqlconnection), mysqli_errno($mysqlconnection));
	}
		
    return $result;
}

function FetchSingleEx($sql)
{
	$res = QueryDbEx($sql);
	LogQuery($sql);
	LogIfError($sql);
	
	if (mysqli_num_rows($res) > 0)
	{
		$row = mysqli_fetch_row($res);
		return $row[0];
	}
	else
	{
		return NULL;
	}
}

function LogQuery($sql)
{
	global $G_ENABLE_QUERY_LOG, $G_FILE_LOG_QUERY;
	
	if (!$G_ENABLE_QUERY_LOG)
		return;
		
	$logPath = @realpath(@dirname(__FILE__)) . "/../../log";
	$logExists = @file_exists($logPath) && @is_dir($logPath);
	if (!$logExists)
		@mkdir($logPath, 0644);
	
	$logFile = @realpath(@dirname(__FILE__)) . "/../../log/" . $G_FILE_LOG_QUERY;
	$modeFile = (@file_exists($logFile) && @filesize($logFile) > 1024 * 1024) ? "w" : "a";
	
	$fp = @fopen($logFile, $modeFile);
	@fwrite($fp, "-- Query Executed on " . date('d-M-Y H:i:s') . " --------\r\n");
	@fwrite($fp, " SCRIPT > " . $_SERVER['SCRIPT_NAME'] . "\r\n");
	@fwrite($fp, " QUERY  > $sql\r\n");
	@fwrite($fp, "\r\n");
	@fclose($fp);
}

function LogIfError($sql)
{
    global $mysqlconnection;

    if (mysqli_errno($mysqlconnection) == 0)
        return;

    echo "<font style='color:red; font-weight:boldl'>SQL Error Logged</font><br>";
    LogError($sql, mysqli_errno($mysqlconnection), mysqli_error($mysqlconnection));
}

function QueryDbEx2($sql)
{
    global $mysqlconnection;

    $result = @mysqli_query($mysqlconnection, $sql);
    LogQuery($sql);

    if (mysqli_errno($mysqlconnection) > 0)
    {
        LogError($sql, mysqli_errno($mysqlconnection), mysqli_error($mysqlconnection));
        throw new DbException(mysqli_error($mysqlconnection), mysqli_errno($mysqlconnection));
    }

    return $result;
}
?>