<?php
/**[N]**
 * JIBAS Education Community
 * Jaringan Informasi Bersama Antar Sekolah
 * 
 * @version: 2.3.0 (September 24, 2010)
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
<?php 
require_once("include/theme.php");
require_once("include/sessioninfo.php"); 
$nama = SI_USER_NAME();
if ($nama=="landlord")
	$nama = "Administrator JIBAS [InfoSiswa]";
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<script type="text/javascript" language="JavaScript">
function get_fresh(){
	document.location.reload();
}
</script>
</head>

<body style="background-color:#5c5200" background="<?php echo GetThemeDir()?>bkmain_01.jpg" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table id="Table_01" width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td>
			<img src="<?php echo GetThemeDir()?>InfoSiswa_16.png" width="20" height="27" alt=""></td>
		<td colspan="2" background="<?php echo GetThemeDir()?>InfoSiswa_17.png" width="100%" height="27">
            <font color=#FFFFFF face="verdana" size="1"><b>&nbsp;Selamat Datang <?php echo $nama?></b></font></td>
		<td>
			<img src="<?php echo GetThemeDir()?>InfoSiswa_18.png" width="17" height="27" alt=""></td>
	</tr>
</table>
</html>