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
global $nisa;
function lagi() {
	coba(); 
	echo '<br>lagi nyoba lagi'.$nisa[1];
}


function coba() {	
	echo 'jum '.$_REQUEST['jum'];
		for ($i=1;$i<=$_REQUEST['jum'];$i++) {
			$pilih = $_REQUEST['pilih'.$i];
			$nis = $_REQUEST['nis'.$i];
			if ($pilih) {
				$GLOBALS['nisa'][$i] = $nis;
				//lagi($nisa);
			//echo '<br>pilih '.$nis.' '.$i;	
			}
		}		
	return $GLOBALS['nisa'];
}





function coba1() {
	$GLOBALS['nisa'][] = $a;
	//$GLOBALS[nisa][$i] = $nis;
	
}	



?>