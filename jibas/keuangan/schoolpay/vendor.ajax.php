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
require_once('../include/sessionchecker.php');
require_once('../include/common.php');
require_once('../include/rupiah.php');
require_once('../include/config.php');
require_once('../include/db_functions.php');
require_once('../include/sessioninfo.php');
require_once('../include/errorhandler.php');
require_once('../library/stringbuilder.php');
require_once('vendor.func.php');

$op = $_REQUEST["op"];
if ($op == "568789673945")
{
    OpenDb();
    SetVendorAktif();
    CloseDb();
}
else if ($op == "847293847324")
{
    OpenDb();
    echo HapusVendor();
    CloseDb();
}
else if ($op == "2876328746237462")
{
    OpenDb();
    HapusUserVendor();
    CloseDb();
}
else if ($op == "98789769")
{
    $vendorId = $_REQUEST["vendorid"];

    OpenDb();
    ShowDaftarPetugas($vendorId);
    CloseDb();
}
else if ($op == "387298378923")
{
    OpenDb();
    echo HapusVendor();
    CloseDb();
}
?>