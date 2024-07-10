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
require_once('../include/errorhandler.php');
require_once('../include/sessioninfo.php');
require_once('../include/compatibility.php');
require_once('../include/common.php');
require_once('../include/config.php');
require_once('../include/db_functions.php');
require_once('../library/departemen.php');
require_once("impnilai.process.func.php");

$op = $_REQUEST['op'];
if ($op == "getselectaspek")
{
    $idpelajaran = $_REQUEST['idpelajaran'];
    $idtingkat = $_REQUEST['idtingkat'];
    $nip = $_REQUEST['nip'];
    $selaspek = $_REQUEST['selaspek'];

    OpenDb();
    $select = SelectAspek();
    CloseDb();

    $result = array('idaspek' => $idaspek, 'select' => urlencode($select));
    echo json_encode($result);
    http_response_code(200);
}
else if ($op == "getselectjenisujian")
{
    $idpelajaran = $_REQUEST['idpelajaran'];
    $idaspek = $_REQUEST['idaspek'];
    $idtingkat = $_REQUEST['idtingkat'];
    $idkelas = $_REQUEST['idkelas'];
    $nip = $_REQUEST['nip'];

    OpenDb();
    $select = SelectJenisUjian();
    CloseDb();

    echo urlencode($select);
    http_response_code(200);
}
else if ($op == "getselectrpp")
{
    $idpelajaran = $_REQUEST['idpelajaran'];
    $idtingkat = $_REQUEST['idtingkat'];
    $idsemester = $_REQUEST['idsemester'];

    OpenDb();
    $select = SelectRpp();
    CloseDb();

    echo urlencode($select);
    http_response_code(200);
}
?>
