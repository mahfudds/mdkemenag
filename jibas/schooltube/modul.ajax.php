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
require_once ("include/session.php");
require_once ("include/config.php");
require_once ("include/db_functions.php");
require_once ("modul.func.php");
require_once ("common.func.php");

$op = $_REQUEST["op"];
if ($op == "setFollow")
{
    $follow = $_REQUEST["follow"];
    $idModul = $_REQUEST["idModul"];

    OpenDb();
    SaveFollow($idModul, $follow);
    CloseDb();
}
else if ($op == "getFollowerCount")
{
    $idModul = $_REQUEST["idModul"];

    OpenDb();
    echo GetFollowerCount($idModul);
    CloseDb();
}
else if ($op == "nextSearch")
{
    $idMediaList = $_REQUEST["idMediaList"];
    $page = $_REQUEST["page"];

    OpenDb();
    ShowMedia($idMediaList, $page);
    CloseDb();
}
else if ($op == "changeVideoOrder")
{
    $idModul = $_REQUEST["idModul"];
    $urutan = $_REQUEST["urutan"];

    OpenDb();
    echo GetVideoList($idModul, $urutan);
    CloseDb();
}
else if ($op == "reloadVideoList")
{
    $idMediaList = $_REQUEST["idList"];

    OpenDb();
    ShowMedia($idMediaList, 1);
    CloseDb();
}
?>
