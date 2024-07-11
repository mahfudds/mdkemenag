<?
/**[N]**
 * JIBAS Education Community
 * Jaringan Informasi Bersama Antar Sekolah
 * 
 * @version: 29.0 (Sept 20, 2023)
 * @notes: JIBAS Education Community will be managed by Yayasan Indonesia Membaca (http://www.indonesiamembaca.net)
 *  
 * Copyright (C) 2009 Yayasan Indonesia Membaca (http://www.indonesiamembaca.net)
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
require_once('../inc/errorhandler.php');
require_once("../inc/sessionchecker.php");
require_once("../inc/config.php");
require_once("../inc/db_functions.php");
require_once("../inc/common.php");
require_once('../inc/theme.php');
require_once("../inc/sessioninfo.php");

$tahun30 = $_REQUEST['tahun30'];
$bulan30 = $_REQUEST['bulan30'];
$tanggal30 = $_REQUEST['tanggal30'];
$tahun = $_REQUEST['tahun'];
$bulan = $_REQUEST['bulan'];
$tanggal = $_REQUEST['tanggal'];

OpenDb();
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>JIBAS EMA</title>
<link rel="stylesheet" href="../style/style.css" />
<script type="application/x-javascript" src="../script/jquery-1.9.1.js"></script>
<script language="javascript" src="../script/tables.js"></script>
<script language="javascript">
showPresence = function(nip)
{
	var tahun30 = $("#tahun30").val();
    var bulan30 = $("#bulan30").val();
    var tanggal30 = $("#tanggal30").val();
    var tahun = $("#tahun").val();
    var bulan = $("#bulan").val();
    var tanggal = $("#tanggal").val();
    
    parent.stat.location.href = "rekappresensi.stat.php?nip="+nip+"&tahun30="+tahun30+"&bulan30="+bulan30+"&tanggal30="+tanggal30+"&tahun="+tahun+"&bulan="+bulan+"&tanggal="+tanggal;	
}
</script>
</head>

<body style="background-color:#F0F0F0">
<input type="hidden" name="tahun30" id="tahun30" value="<?=$tahun30?>">    
<input type="hidden" name="bulan30" id="bulan30" value="<?=$bulan30?>">    
<input type="hidden" name="tanggal30" id="tanggal30" value="<?=$tanggal30?>">
<input type="hidden" name="tahun" id="tahun" value="<?=$tahun?>">    
<input type="hidden" name="bulan" id="bulan" value="<?=$bulan?>">    
<input type="hidden" name="tanggal" id="tanggal" value="<?=$tanggal?>"> 
<table border="0" cellpadding="2" cellspacing="2" width="100%" class="tab" id="table">
<tr height="30">
	<td class="header" width="15" align="center">No</td>
    <td class="header" width="70" align="center">NIP</td>
    <td class="header" width="130" align="center">Nama</td>
    <td class="header" width="15" align="center">&nbsp;</td>
</tr>
<?
$sql = "SELECT nip, nama
		  FROM jbssdm.pegawai
		 WHERE aktif = 1 
		 ORDER BY nama"; 
$result = QueryDb($sql);
$cnt = 0;
while ($row = mysql_fetch_row($result))
{
?>
<tr>
	<td align="center"><?=++$cnt?></td>
    <td align="center"><?=$row[0]?></td>
    <td align="left"><?=$row[1]?></td>
    <td align="center">
    <input type="button" value=" > " class="but" onclick="JavaScript:showPresence('<?=$row[0]?>')" />
    </td>
</tr>
<?
}
CloseDb();
?>
</table>
<script language='JavaScript'>
	Tables('table', 1, 0);
</script>
</body>
</html>