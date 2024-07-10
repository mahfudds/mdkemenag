<?php
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
require_once('../include/sessionchecker.php');
require_once('../include/common.php');
require_once('../include/rupiah.php');
require_once('../include/config.php');
require_once('../include/db_functions.php');
require_once('../include/sessioninfo.php');
require_once('../include/errorhandler.php');
require_once('../library/logger.php');
require_once('../library/smsmanager.func.php');
require_once('onlinepay.util.func.php');
require_once('onlinepay.jurnal.php');
require_once('lebihtrans.proses.func.php');

$op = $_REQUEST["op"];
if ($op == "7463832746829347328")
{
    OpenDb();
    SimpanTabungan();
    CloseDb();
}
else if ($op == "5488745683756348756738")
{
    OpenDb();
    SimpanTransferBalik();
    CloseDb();
}
?>