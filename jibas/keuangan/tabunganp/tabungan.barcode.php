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

$json = "{\"status\":\"-1\",\"message\":\"EMPTY\",\"userid\":\"EMPTY\"}";

$response = "---";
$kode = $_REQUEST['kode'];
$departemen = $_REQUEST['departemen'];

OpenDb();
$sql = "SELECT s.replid, a.departemen 
          FROM jbsakad.siswa s, jbsakad.angkatan a 
         WHERE s.nis = '$kode' 
           AND s.aktif = 1
           AND s.idangkatan = a.replid";
$res = QueryDb($sql);
if (mysqli_num_rows($res) > 0)
{
    $row = mysqli_fetch_row($res);
    $userId = $kode;
    $userDept = $row[1];

    if ($departemen == $userDept)
    {
        $json = "{\"status\":\"1\",\"message\":\"OK\",\"userid\":\"$userId\"}";
    }
    else
    {
        $json = "{\"status\":\"-1\",\"message\":\"siswa tidak dapat melakukan transaksi di $departemen\",\"userid\":\"EMPTY\"}";
    }
}
else
{
    $json = "{\"status\":\"-1\",\"message\":\"tidak ditemukan data siswa\",\"userid\":\"EMPTY\"}";
}
CloseDb();

echo $json;
?>