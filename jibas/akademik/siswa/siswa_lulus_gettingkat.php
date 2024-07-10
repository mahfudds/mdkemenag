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
require_once('../include/errorhandler.php');
require_once('../include/sessioninfo.php');
require_once('../include/common.php');
require_once('../include/config.php');
require_once('../include/db_functions.php');
$departemen=$_REQUEST['departemen'];
?>
<select name="tingkat" id="tingkat" onchange="change_tingkat()">
  <?
OpenDb();
$sql_tingkat="SELECT t.replid,t.tingkat FROM jbsakad.tingkat t WHERE t.departemen='$departemen' AND t.aktif=1 ORDER BY t.urutan";
$result_tingkat=QueryDb($sql_tingkat);
while ($row_tingkat=@mysqli_fetch_row($result_tingkat)){
	if ($tingkat=="")
		$tingkat=$row_tingkat[0];
?>
      <option value="<?=$row_tingkat[0]?>" <?=StringIsSelected($row_tingkat[0], $tingkat) ?>>
        <?=$row_tingkat[1]?>
        </option>
      <?
}
CloseDb();
?></select>