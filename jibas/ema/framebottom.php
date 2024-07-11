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
require_once("inc/config.php");
require_once("inc/sessioninfo.php");
require_once("inc/sessionchecker.php");
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<link href="style/style.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
.style1 {
	font-family: Calibri;
	font-size: 16px;
	color: #333;
}
.style2 {font-weight: bold; color: #FF0000; font-family: Verdana;}
.style7 {
	font-size: 16px;
	color: #666666;
}
.style10 {color: #FF0000; font-size: 13px;}
-->
</style>
</head>

<body style="margin-bottom:0px;margin-top:0px;margin-left:0px;margin-right:0px;background-color:#dfdec9">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="40" valign="middle" style="background-image:url(img/bgbottom.gif); background-repeat:repeat-x; padding-bottom:8px " align="center"><span class="nodata style10" style='color:#fff'><?=$G_COPYRIGHT?></span></td>
    <td valign="middle" style="background-image:url(img/bgbottom.gif); background-repeat:repeat-x;padding-bottom:5px " align="center"><span class="style2"><span class="style1">Welcome      
    <?=SI_USER_NAME()?>
    </span></span></td>
  </tr>
</table>
</body>


</html>