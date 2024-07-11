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
require_once("../include/config.php");
require_once("../include/common.php");
require_once("../include/compatibility.php");
require_once("../include/db_functions.php");
require_once("galeri.list.func.php");
require_once("mading.common.func.php");

OpenDb();
?>
<table border='0' cellpadding='2' cellspacing='0' width='98%'>
<tr>
    <td align='left' valign='top'>
        <font class='TitleTabMenu'>G A L E R I</font>    
    </td>
    <td align='right' valign='bottom'>
        <a onclick='gallst_NewGalleryClicked()'>galeri baru</a>&nbsp;&nbsp;
        <a onclick='gallst_ShowGalleryIndexClicked()'>indeks galeri</a>&nbsp;&nbsp;
        <a onclick='gallst_RefreshGalleryList()'>refresh</a>        
    </td>
</tr>    
</table>
<br>
<table id='gallst_GalleryListTable' border='0' width='98%' cellspacing='0' cellpadding='5'>
<tbody>
    
</tbody>
<tfoot>
    
</tfoot>
</table>
<?
CloseDb();
?>