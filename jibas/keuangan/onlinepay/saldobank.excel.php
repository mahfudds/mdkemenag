<?php
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
<?php
require_once('../include/sessionchecker.php');
require_once('../include/common.php');
require_once('../include/rupiah.php');
require_once('../include/config.php');
require_once('../include/db_functions.php');
require_once('../include/sessioninfo.php');
require_once('../library/departemen.php');
require_once('../include/errorhandler.php');
require_once('onlinepay.util.func.php');

$departemen = $_REQUEST["departemen"];

OpenDb();

header('Content-Type: application/vnd.ms-excel'); //IE and Opera
header('Content-Type: application/x-msexcel'); // Other browsers
header('Content-Disposition: attachment; filename=SaldoBank.xls');
header('Expires: 0');
header('Cache-Control: must-revalidate, post-check=0, pre-check=0');
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Saldo Bank</title>
</head>
<body>
<center><font size="4"><strong>SALDO BANK</strong></font><br /> </center><br />
<table id="tabReport" border="0" cellpadding="5" cellspacing="0">
<tr style="height: 25px">
<td>No</td>
<td>Bank</td>
<td>Rekening</td>
<td>Saldo</td>
</tr>
<?php
$sql = "SELECT b.bank, bs.bankno, SUM(bs.saldo) AS saldo
          FROM jbsfina.bank b, jbsfina.banksaldo bs
         WHERE b.bankno = bs.bankno";
if ($departemen != "ALL")
    $sql .= " AND bs.departemen = '$departemen'";
$sql .= " GROUP BY b.bank, bs.bankno";

$no = 0;
$res = QueryDb($sql);
while($row = mysql_fetch_array($res))
{
    $no += 1;

    echo "<tr>";
    echo "<td>$no</td>";
    echo "<td>$row[bank]</td>";
    echo "<td>$row[bankno]</td>";
    echo "<td>$row[saldo]</td>";
    echo "</tr>";
}
echo "</table>";

CloseDb();
?>
