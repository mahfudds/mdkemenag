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
require_once('../inc/config.php');
require_once('../inc/sessionchecker.php');

require_once('../inc/getheader.php');
require_once('../inc/common.php');
require_once('../inc/db_functions.php');
OpenDb();
$departemen=$_REQUEST[departemen];
?>
<link href="../style/style.css" rel="stylesheet" type="text/css" />
<form name="frmPilih">
<table width="100%" border="0" cellspacing="2" cellpadding="1">
  <tr>
    <td width="4%" class="tab2">Tingkat</td>
    <td width="96%">
    <div id="tktInfo">
    <select name="tingkat" class="cmbfrm" id="tingkat" onchange="chg_tkt()">
	<?
	$sql = "SELECT replid,tingkat FROM tingkat WHERE departemen='$departemen'";
	$result = QueryDb($sql);
	while ($row = @mysql_fetch_row($result)){
		if ($tingkat=="")
			$tingkat = $row[0];	
	?>
	<option value="<?=$row[0]?>"><?=$row[1]?></option>
	<?
	}
	?>
	</select>
    </div>
    <?
	$sql = "SELECT replid FROM tahunajaran WHERE departemen='$departemen' AND aktif=1";
	$result = QueryDb($sql);
	$row = @mysql_fetch_array($result);
	$ta = $row[replid];
	?>
    <input type="hidden" name="ta" id="ta" value="<?=$ta?>" />
    </td>
  </tr>
  <tr>
    <td class="tab2">Kelas</td>
    <td>
    <div id="klsInfo">
    <select name="kelas" class="cmbfrm" id="kelas" onchange="chg_kls()">
	<?
	$sql = "SELECT replid,kelas FROM kelas WHERE idtingkat='$tingkat' AND idtahunajaran='$ta' AND aktif=1 ORDER BY kelas";
	$result = QueryDb($sql);
	while ($row = @mysql_fetch_row($result)){
		if ($kelas=="")
			$kelas = $row[0];	
	?>
	<option value="<?=$row[0]?>"><?=$row[1]?></option>
	<?
	}
	?>
	</select>
    
    </div>
    </td>
  </tr>
  <tr>
    <td colspan="2">
    <div id="sisInfo">
    <table width="100%" border="1" class="tab">
      <tr>
        <td height="25" align="center" class="header">NIS</td>
        <td height="25" align="center" class="header">Nama</td>
        <td height="25" align="center" class="header">&nbsp;</td>
      </tr>
      <?
	  $sql = "SELECT * FROM siswa WHERE idkelas=$kelas ORDER BY nama";
	  $result = QueryDb($sql);
	  $num = @mysql_num_rows($result);
	  if ($num>0){
	  while ($row = @mysql_fetch_array($result)){
	  ?>
      <tr>
        <td height="20" align="center"><?=$row[nis]?></td>
        <td height="20"><?=$row[nama]?></td>
        <td height="20" align="center"><input type="button" value=" > " class="cmbfrm2" onClick="pilihsiswa('<?=$row[nis]?>')" /></td>
      </tr>
      <? } ?>
      <? } else { ?>
      <tr>
        <td height="20" colspan="3" align="center" class="nodata">Tidak ada data</td>
      </tr>
	  <? } ?>
    </table>
    </div>
    </td>
  </tr>
</table>
</form>