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
require_once('../include/common.php');
require_once('../include/config.php');
require_once('../include/db_functions.php');
//$departemen="-1";

	$pelajaran=$_REQUEST['pelajaran'];
	if ($pelajaran=="-1"){
	$sql_tambahan="";
	} else {
	$sql_tambahan="AND pel.replid='$pelajaran'";
	}


?>
<table width="100%" id="table" class="tab" align="center" cellpadding="2" cellspacing="0" bordercolor="#000000">
<tr height="30">
<td class="header" width="7%" align="center">No</td>
    		<td class="header" width="15%" align="center">N I P</td>
    		<td class="header" >Nama</td>
    		<td class="header" width="10%">&nbsp;</td>
		</tr>
		<?
		OpenDb();
		$sql = "SELECT p.nip, p.nama FROM jbssdm.pegawai p, jbsakad.pelajaran pel, jbsakad.guru g WHERE pel.replid=g.idpelajaran AND g.nip=p.nip ".$sql_tambahan;
		//$sql = "SELECT p.nip, p.nama FROM jbssdm.pegawai p LEFT JOIN (guru g LEFT JOIN pelajaran l ON l.replid = g.idpelajaran) ON p.nip = g.nip GROUP BY p.nip";
		$result = QueryDb($sql);
		$cnt = 0;
		while($row = mysqli_fetch_row($result)) { ?>
		<tr>
			<td align="center"><?=++$cnt ?></td>
    		<td align="center"><?=$row[0] ?></td>
    		<td><?=$row[1] ?></td>
    		<td align="center">
    		<input type="button" name="pilih" class="but" id="pilih" value="Pilih" onclick="pilih('<?=$row[0]?>', '<?=$row[1]	?>')" />
    	   	</td>
		</tr>
		<? 	} ?>
		<tr height="26">
			<td colspan="4" align="center" >
        	<input type="button" class="but" name="tutup" id="tutup" value="Tutup" onclick="window.close()" /></td>
		</tr>	
		</table>