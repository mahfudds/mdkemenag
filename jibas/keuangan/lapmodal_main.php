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
require_once('include/errorhandler.php');
require_once('include/sessionchecker.php');
require_once('include/sessioninfo.php');
if (getLevel() == 2) { ?>
	<script language="javascript">
        alert('Maaf, anda tidak berhak mengakses halaman ini!');
        document.location.href = "lapkeuangan.php";
    </script>
<?  exit();
} ?>   
<frameset border="1" rows="70,*" frameborder="yes">
	<frame name="header" src="lapmodal_header.php" scrolling="no" noresize="noresize" style="border:1; border-bottom-color:#000000; border-bottom-style:solid" />
    <frame name="content" src="lapmodal_blank.php" />
</frameset><noframes></noframes>