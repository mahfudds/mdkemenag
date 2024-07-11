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
<?php
require_once("ujianumum.func.php");

$op = $_REQUEST["op"];

if ($op == "getpilihanujian")
{
    echo getPilihanUjian();
}
else if ($op == "getpilihandept")
{
    echo getPilihanDept();
}
else if ($op == "getpilihanpelajaran")
{
    $dept = $_REQUEST["dept"];

    echo getPilihanPelajaran($dept);
}
else if ($op == "getdaftarujian")
{
    $dept = $_REQUEST["dept"];
    $viewDaftarUjian = $_REQUEST["viewdaftarujian"];
    $idPelajaran = $_REQUEST["idpelajaran"];

    echo getDaftarUjian($dept, $viewDaftarUjian, $idPelajaran);
}
else if ($op == "startujian")
{
    $idUjian = $_REQUEST["idujian"];
    $idRemedUjian = $_REQUEST["idremedujian"];
    $idUjianSerta = $_REQUEST["idujianserta"];
    $idJadwalUjian = $_REQUEST["idjadwalujian"];

    echo startUjian($idUjian, $idRemedUjian, $idUjianSerta, $idJadwalUjian);
}
?>