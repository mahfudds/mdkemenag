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
require_once('../inc/sessionchecker.php');
require_once('../inc/common.php');
require_once('../inc/config.php');
require_once('../inc/getheader.php');
require_once('../inc/db_functions.php');
require_once('../inc/rupiah.php');

$nis = $_SESSION["infosiswa.nis"];

$tahun = 0;
if (isset($_REQUEST['tahun']))
  $tahun = $_REQUEST['tahun'];
?>

<form name='panelperpus'>
<?  
OpenDb();

$sql = "SELECT DISTINCT YEAR(p.tglpinjam)
	      FROM jbsperpus.pinjam p
		 WHERE p.idanggota = '$nis'
		 ORDER BY YEAR(p.tglpinjam) DESC";
$result = QueryDb($sql);
$ntahun = mysql_num_rows($result);

if ($ntahun == 0)
{
  CloseDb();
  echo "Belum ada data peminjaman<br>";
  exit();
}

echo "Tahun: <select name='tahun' class='cmbfrm' id='tahun' style='width:150px' onChange=\"ChangePerpusOption('tahun')\">";
while($row = mysql_fetch_row($result))
{
  if ($tahun == 0)
	$tahun = $row[0];
  echo "<option value='$row[0]' " . IntIsSelected($tahun, $row[0]) . " > " . $row[0] . "</option>";
} 
echo "</select>";

$sql = "SELECT pu.judul, DATE_FORMAT(p.tglpinjam, '%d-%b-%Y'), pu.replid,
			   DATE_FORMAT(p.tglkembali, '%d-%b-%Y'), p.status,
			   DATE_FORMAT(p.tglditerima, '%d-%b-%Y'), d.kodepustaka
	      FROM jbsperpus.pinjam p, jbsperpus.daftarpustaka d, jbsperpus.pustaka pu
		 WHERE p.nis = '$nis'
		   AND YEAR(p.tglpinjam) = '$tahun'
		   AND p.kodepustaka=d.kodepustaka
		   AND d.pustaka=pu.replid
		   AND p.status <> '0'
		 ORDER BY p.tglpinjam DESC";
$result = QueryDb($sql);
$cnt=1;
?>
<div style="height:15px">&nbsp;</div>
<table width="100%" border="1" cellspacing="0" cellpadding="0" class="tab">
  <tr height="25">
    <td width='5%' align="center" class="header">No</td>
	<td width='*' align="center" class="header">Judul Pustaka</td>
	<td width='15%' align="center" class="header">Tanggal<br>Pinjam</td>
	<td width='15%' align="center" class="header">Jadwal<br>Kembali</td>
	<td width='15%' align="center" class="header">Tanggal Kembali</td>
  </tr>
  <? if (@mysql_num_rows($result)>0) { ?>
  <? while ($row = @mysql_fetch_row($result)) { ?>
  <tr>
    <td height="20" align="center"><?=$cnt?></td>
    <td height="20">
	  <font style='font-style: italic; font-size: 9px'><?=$row[6]?></font><br>
	  <font style='font-weight: bold; font-size: 11px'><?=$row[0]?></font>
	</td>
    <td height="20" align="center"><?=$row[1]?></td>
    <td height="20" align="center"><?=$row[3]?></td>
    <td align="center">
<?	if ($row[4]=='1')
	  echo "-";
	elseif ($row[4]=='2')
	  echo $row[5]; ?>
    </td>
  </tr>
  <? $cnt++; ?>
  <? } ?>
  <? } else { ?>
  <tr>
    <td colspan="5" height="20" align="center">Belum ada data peminjaman</td>
  </tr>
  <? } ?>
</table>
<?
CloseDb();
?>
</form>