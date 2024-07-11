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
require_once("../include/sessionchecker.php");
require_once("../include/config.php");
require_once("../include/db_functions.php");
require_once("../include/common.php");
require_once('../include/theme.php');
require_once("../include/sessioninfo.php");
require_once("daftardiklat.class.php");

OpenDb();
$DD = new DaftarDiklat();
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>JIBAS Kepegawaian</title>
<link rel="stylesheet" href="../style/style<?=GetThemeDir2()?>.css" />
<script language="javascript" src="../script/tables.js"></script>
<script language="javascript" src="../script/validasi.js"></script>
<script language="javascript" src="../script/tools.js"></script>
<script language="javascript" src="daftardiklat.js"></script>
</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" bgcolor="#ffffff">
<br />
<input type="hidden" name="nip" id="nip" value="<?=$DD->nip?>">
<p align="center">
<font class="subtitle"><?=$DD->nama?> - <?=$DD->nip?></font><br />
<a href="JavaScript:Refresh()"><img src="../images/ico/refresh.png" border="0" />&nbsp;refresh</a>&nbsp;
<a href="JavaScript:Cetak()"><img src="../images/ico/print.png" border="0" />&nbsp;cetak</a>&nbsp;
<br />
</p>

<table border="0" cellpadding="5" cellspacing="0" width="100%" id="table56">
<tr>
	<td width="100%" align="left" style="border-bottom:thin dashed #CCCCCC; border-top:none; border-left:none; border-right:none;">
        <font style="background-color:#FFCC33; font-size:14px">&nbsp;&nbsp;</font>
        <font class="subtitle">Riwayat Diklat</font><br />
    </td>
</tr>
<tr><td>

<table border="0" cellpadding="3" cellspacing="0" width="100%">
<tr><td align="right">
<a href="JavaScript:Tambah()"><img src="../images/ico/tambah.png" border="0" />&nbsp;tambah</a>
</td></tr>
</table>
<table border="1" id="table" style="border-collapse:collapse" cellpadding="0" cellspacing="0" width="100%" class="tab">
<tr height="30">
	<td width="5%" align="center" class="header">No</td>
    <td width="25%" align="center" class="header">Diklat</td>
    <td width="5%" align="center" class="header">Tahun</td>
    <td width="7%" align="center" class="header">&nbsp;</td>
    <td width="20%" align="center" class="header">SK</td>
    <td width="28%" align="center" class="header">Keterangan</td>
    <td width="10%" align="center" class="header">&nbsp;</td>
</tr>
<?
$sql = "SELECT p.replid, p.iddiklat, d.diklat, p.tahun, p.sk, p.keterangan, p.terakhir
		  FROM jbssdm.pegdiklat p, jbssdm.diklat d
		 WHERE p.nip = '$DD->nip' AND p.iddiklat = d.replid ORDER BY p.tahun DESC, p.replid DESC";
$result = QueryDb($sql);
$cnt = 0;
while ($row = mysqli_fetch_array($result)) {
?>
<tr height="25">
	<td align="center"><?=++$cnt?></td>
    <td align="left"><?=$row['diklat']?></td>
    <td align="center"><?=$row['tahun']?></td>
    <td align="center">
	<?	if ($row['terakhir'] == 1) { ?>
    	<img src="../images/ico/aktif.png" border="0" title="diklat terakhir" />
    <?	} else { ?>
    	<a title="klik untuk menjadi diklat terakhir" href="JavaScript:ChangeLast(<?=$row['replid']?>)"><img src="../images/ico/nonaktif.png" border="0" /></a>
    <?	} ?>
    </td>
    <td align="left"><?=$row['sk']?></td>
    <td align="left"><?=$row['keterangan']?></td>
    <td align="center">
	    <a href="JavaScript:Ubah(<?=$row['replid']?>)" title="edit"><img src="../images/ico/ubah.png" border="0" /></a>&nbsp;
    	<a href="JavaScript:Hapus(<?=$row['replid']?>)" title="hapus"><img src="../images/ico/hapus.png" border="0" /></a>
    </td>
</tr>
<?
}
?>
</table>
</td></tr>
</table>
<?
CloseDb();
?>    

<script language='JavaScript'>
	Tables('table', 1, 0);
</script>


</body>
</html>



