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
<html>
<head>
<title>Untitled Document</title>
<link rel="stylesheet" type="text/css" href="../style/style.css">
</head>
<body>
<table width="100%" border="0" height="100%" >
<tr height="250">
    <td align="left" valign="top" background="../images/ico/b_presensipelajaran.png"
    style="background-repeat:no-repeat;">
    <table border="0"width="100%" height="100%"> 
    <tr>
    	<td align="center">
       	<? if ($_REQUEST['tipe']=="harian") { ?>
           	<font size="2" color="#757575"><b>Klik icon <img src="../images/ico/view_x.png" border = "0"> di atas untuk menampilkan
        Presensi Harian</b></font>
        <? } elseif ($_REQUEST['tipe']=="isi") { ?>
        	<font size="2" color="#757575"><b>Klik pada tombol "<strong>Input Presensi Baru</strong>" atau <em>hyperlink</em> "<strong>Tanggal</strong>" di panel kiri untuk menampilkan Presensi Harian</b></font>
		<? } else { ?>
        	<font size="2" color="#757575"><b>Klik icon <img src="../images/ico/view_x.png" border = "0"> di atas untuk menampilkan
        Presensi Pelajaran</b></font>
       	  <? } ?></td>
   	</tr>
    </table>
    </td>
</tr>
</table>
</body>
</html>