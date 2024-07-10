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
require_once('../include/errorhandler.php');
require_once('../include/sessioninfo.php');
require_once('../include/common.php');
require_once('../include/config.php');
require_once('../include/db_functions.php');
require_once('../include/getheader.php');
 
$aktif = 0;
$guru = $_REQUEST['departemen'];
$departemen = $_REQUEST['departemen'];
$query ="AND j.departemen = '$departemen'";
$urut = $_REQUEST['urut'];
$urutan = $_REQUEST['urutan'];

if ($_REQUEST['aktif']) { 	
	$aktif = 1;
	$id = $_REQUEST['id'];
	OpenDb();
	$sql = "SELECT nama FROM pelajaran WHERE replid ='$id'";
	$result = QueryDb($sql); 
	CloseDb();
	$row = mysqli_fetch_array($result);
	$guru = $row['nama'];
	$query = "AND g.idpelajaran='$id'";
}

?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="stylesheet" type="text/css" href="../style/style.css">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>JIBAS SIMAKA [Cetak Data Guru]</title>
</head>

<body>
<table border="0" cellspacing="10" cellpadding="5" width="780" align="left">
<tr><td align="left" valign="top">

<?=getHeader($departemen)?>

<center>
  <font size="4"><strong>DATA GURU</strong></font><br />
 </center>
<br />
    <br />
    <strong>Guru <?=$guru?></strong>
    <br /><br />
    
	<table class="tab" id="table" border="1" style="border-collapse:collapse" width="100%" align="left" bordercolor="#000000">
    <!-- TABLE CONTENT -->
    
    <tr height="30">
        <td width="4%" class="header" align="center">No</td>
        <td width="10%" class="header" align="center">NIP</td>
        <td width="15%" class="header" align="center">Guru</td>
        <? if (!$aktif) { ?>
        	<td width="15%" class="header" align="center">Pelajaran</td>
        <? } ?>
        <td width="15%" class="header" align="center">Status Guru</td>
        <td width="*" class="header" align="center">Keterangan</td>
    </tr>
   		 <?
		OpenDb();
		$sql = "SELECT g.replid,g.nip,p.nama,g.statusguru,g.keterangan,j.nama FROM guru g, jbssdm.pegawai p, pelajaran j, statusguru s WHERE g.nip=p.nip AND g.idpelajaran = j.replid AND g.statusguru = s.status $query ORDER BY $urut $urutan"; 
		
		$result = QueryDb($sql);
		$cnt = 0;
		while ($row = @mysqli_fetch_row($result)) {
	
		?>
    <tr height="25">   	
       	<td align="center"><?=++$cnt ?></td>
        <td align="center"><?=$row[1]?></td>
        <td><?=$row[2] ?></td>
         <? if (!$aktif) { ?>
        	<td><?=$row[5]?></td>
        <? } ?> 
        <td><?=$row[3]?></td>
        <td><?=$row[4]?></td>        
    </tr>
<?	} 
	CloseDb(); ?>	
    
    <!-- END TABLE CONTENT -->
    </table>

</body>
<script language="javascript">
window.print();
</script>
</html>