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
require_once('../library/departemen.php');
require_once('../cek.php');

$departemen = "";
if (isset($_REQUEST['departemen']))
	$departemen = $_REQUEST['departemen'];

$varbaris=10;
if (isset($_REQUEST['varbaris']))
	$varbaris = $_REQUEST['varbaris'];

$page=0;
if (isset($_REQUEST['page']))
	$page = $_REQUEST['page'];
	
$hal=0;
if (isset($_REQUEST['hal']))
	$hal = $_REQUEST['hal'];

$urut = "nama";	
if (isset($_REQUEST['urut']))
	$urut = $_REQUEST['urut'];	

$urutan = "ASC";	
if (isset($_REQUEST['urutan']))
	$urutan = $_REQUEST['urutan'];

$op = $_REQUEST['op'];

if ($op == "dw8dxn8w9ms8zs22") {
	OpenDb();
	$sql = "UPDATE angkatan SET aktif = '$_REQUEST[newaktif]' WHERE replid = '$_REQUEST[replid]' ";
	QueryDb($sql);	
	CloseDb();
} else if ($op == "xm8r389xemx23xb2378e23") {
	OpenDb();
	$sql = "DELETE FROM angkatan WHERE replid = '$_REQUEST[replid]'";
	QueryDb($sql);
	CloseDb();	
$page=0;
$hal=0;
}	
OpenDb();
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="stylesheet" type="text/css" href="../style/style.css">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Angkatan</title>
<script src="../script/SpryValidationSelect.js" type="text/javascript"></script>
<link href="../script/SpryValidationSelect.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="../style/tooltips.css">
<script language="javascript" src="../script/tooltips.js"></script>
<script language="javascript" src="../script/tables.js"></script>
<script language="javascript" src="../script/tools.js"></script>
<script language="javascript">
function tambah() {
	var departemen = document.getElementById('departemen').value;
	newWindow('angkatan_add.php?departemen='+departemen, 'TambahAngkatan','500','279','resizable=1,scrollbars=1,status=0,toolbar=0')
}

function refresh() {	
	document.location.reload();
}

function tampil() {
	var departemen = document.getElementById('departemen').value;
	document.location.href = "angkatan.php?departemen="+departemen+"&varbaris=<?=$varbaris?>";
}

function setaktif(replid, aktif) {
	var msg;
	var newaktif;
	var departemen = document.getElementById('departemen').value;
	
	if (aktif == 1) {
		msg = "Apakah anda yakin akan mengubah angkatan ini menjadi TIDAK AKTIF?";
		newaktif = 0;
	} else	{	
		msg = "Apakah anda yakin akan mengubah angkatan ini menjadi AKTIF?";
		newaktif = 1;
	}
	
	if (confirm(msg)) 
		document.location.href = "angkatan.php?op=dw8dxn8w9ms8zs22&replid="+replid+"&newaktif="+newaktif+"&departemen="+departemen+"&page=<?=$page?>&hal=<?=$hal?>&varbaris=<?=$varbaris?>";
}

function edit(replid) {
	newWindow('angkatan_edit.php?replid='+replid, 'UbahAngkatan','500','279','resizable=1,scrollbars=1,status=0,toolbar=0')
}

function hapus(replid) {
	var departemen = document.getElementById('departemen').value;
	if (confirm("Apakah anda yakin akan menghapus angkatan ini?"))
		document.location.href = "angkatan.php?op=xm8r389xemx23xb2378e23&replid="+replid+"&departemen="+departemen+"&page=<?=$page?>&hal=<?=$hal?>&varbaris=<?=$varbaris?>";
}

function cetak() {
	var departemen = document.getElementById('departemen').value;
	var total=document.getElementById("total").value;
	
	newWindow('angkatan_cetak.php?departemen='+departemen+'&varbaris=<?=$varbaris?>&page=<?=$page?>&total='+total, 'CetakAngkatan','790','650','resizable=1,scrollbars=1,status=0,toolbar=0')
}

function change_page(page) {
	var departemen=document.getElementById("departemen").value;
	var varbaris=document.getElementById("varbaris").value;
	document.location.href="angkatan.php?departemen="+departemen+"&page="+page+"&hal="+page+"&varbaris="+varbaris;
}

function change_hal() {
	var departemen = document.getElementById("departemen").value;
	var hal = document.getElementById("hal").value;
	var varbaris=document.getElementById("varbaris").value;
	document.location.href="angkatan.php?departemen="+departemen+"&page="+hal+"&hal="+hal+"&varbaris="+varbaris;
}

function change_baris() {
	var departemen = document.getElementById("departemen").value;
	var varbaris=document.getElementById("varbaris").value;
	document.location.href="angkatan.php?departemen="+departemen+"&varbaris="+varbaris;
}

</script>
</head>
<body onload="document.getElementById('departemen').focus()">

<table border="0" width="100%" height="100%">
<!-- TABLE BACKGROUND IMAGE -->
<tr><td align="center" valign="top" background="../images/b_angkatan.png" style="background-repeat:no-repeat">

<table border="0" width="100%" align="center">
<!-- TABLE CENTER -->
<tr>
	<td align="left" valign="top">

	<table border="0"width="95%" align="center">
    <!-- TABLE TITLE -->
    <tr>
        <td align="right"><font size="4" face="Verdana, Arial, Helvetica, sans-serif" style="background-color:#ffcc66">&nbsp;</font>&nbsp;<font size="4" face="Verdana, Arial, Helvetica, sans-serif" color="Gray">Angkatan</font></td>
   	</tr>
    <tr>
        <td align="right"><a href="../referensi.php" target="content">
          <font size="1" color="#000000"><b>Referensi</b></font></a>&nbsp>&nbsp 
          <font size="1" color="#000000"><b>Angkatan</b></font> </td>
        </tr>
    <tr>
      <td align="left">&nbsp;</td>
      </tr>
	</table><br /><br />
    
    <table border="0" cellpadding="0" cellspacing="0" width="95%" align="center">
    <!-- TABLE LINK -->
    <tr>
    	<td align="right" width="35%">
    	<strong>Departemen&nbsp;</strong>
            <select name="departemen" id="departemen" onChange="tampil()">
            <?	$dep = getDepartemen(SI_USER_ACCESS());    
				foreach($dep as $value) {
					if ($departemen == "")
						$departemen = $value; ?>
          		<option value="<?=$value ?>" <?=StringIsSelected($value, $departemen) ?> ><?=$value ?>
                </option>
            <? } ?>
              </select>
   		</td>
    
    <?	
	
	$sql_tot = "SELECT * FROM angkatan WHERE departemen = '$departemen' ORDER BY angkatan DESC";
	$result_tot = QueryDb($sql_tot);
	$total = ceil(mysqli_num_rows($result_tot)/(int)$varbaris);
	$jumlah = mysqli_num_rows($result_tot);
			
	$sql="SELECT * FROM angkatan WHERE departemen = '$departemen' ORDER BY angkatan DESC LIMIT ".(int)$page*(int)$varbaris.",$varbaris";
	
	$akhir = ceil($jumlah/5)*5;
	//$result=QueryDb($sql);
	
	//OpenDb();
	//$sql = "SELECT replid,angkatan,keterangan,aktif FROM angkatan WHERE departemen='$departemen' ORDER BY angkatan DESC";    
	$result = QueryDb($sql);
	if (@mysqli_num_rows($result) > 0){
	
	?>	
    	<input type="hidden" name="total" id="total" value="<?=$total?>"/>
    	<td align="right">
    <a href="#" onClick="document.location.reload()"><img src="../images/ico/refresh.png" border="0" onmouseover="showhint('Refresh!', this, event, '50px')"/>&nbsp;Refresh</a>&nbsp;&nbsp;
    <a href="JavaScript:cetak()"><img src="../images/ico/print.png" border="0" onmouseover="showhint('Cetak!', this, event, '50px')"/>&nbsp;Cetak</a>&nbsp;&nbsp;
<?	if (SI_USER_LEVEL() != $SI_USER_STAFF) { ?>
	    <a href="JavaScript:tambah()"><img src="../images/ico/tambah.png" border="0" onmouseover="showhint('Tambah!', this, event, '50px')"/>&nbsp;Tambah Angkatan</a>
<?	} ?>    </td></tr>
    </table><br />  
      
    <table class="tab" id="table" border="1" style="border-collapse:collapse" width="95%" align="center" bordercolor="#000000">
    <!-- TABLE CONTENT -->
    <tr height="30">
    	<td width="4%" class="header" align="center">No</td>
        <td width="25%" class="header" align="center" >Angkatan</td>
        <td width="*" class="header" align="center">Keterangan</td>
        <td width="10%" class="header" align="center">Status</td>
        <?	if (SI_USER_LEVEL() != $SI_USER_STAFF) { ?>
        <td width="8%" class="header">&nbsp;</td>
        <?	} ?>
    </tr>
    
    <?
		if ($page==0){
				$cnt = 0;
		} else{ 
				$cnt = (int)$page*(int)$varbaris;
		}
		//$cnt = 0;
		while ($row = @mysqli_fetch_array($result)) {
	?>
    <tr height="25">   	
       	<td align="center"><?=++$cnt ?></td>
        <td><?=$row['angkatan']?></td>
        <td><?=$row['keterangan']?></td>        
        <td align="center">
<?		if (SI_USER_LEVEL() == $SI_USER_STAFF) {  
			if ($row['aktif'] == 1) { ?> 
            	<img src="../images/ico/aktif.png" border="0" onmouseover="showhint('Status Aktif!', this, event, '80px')"/>
<?			} else { ?>                
				<img src="../images/ico/nonaktif.png" border="0" onmouseover="showhint('Status Tidak Aktif!', this, event, '80px')"/>
<?			}
		} else { 
			if ($row['aktif'] == 1) { ?>
				<a href="JavaScript:setaktif(<?=$row['replid'] ?>, <?=$row['aktif'] ?>)"><img src="../images/ico/aktif.png" border="0" onmouseover="showhint('Status Aktif!', this, event, '80px')"/></a>
<?			} else { ?>
				<a href="JavaScript:setaktif(<?=$row['replid'] ?>, <?=$row['aktif'] ?>)"><img src="../images/ico/nonaktif.png" border="0" onmouseover="showhint('Status Tidak Aktif!', this, event, '80px')"/></a>
<?			} //end if
		} //end if ?>        </td>
<?		if (SI_USER_LEVEL() != $SI_USER_STAFF) {  ?> 
        <td align="center">
            <a href="JavaScript:edit(<?=$row['replid'] ?>)"><img src="../images/ico/ubah.png" border="0" onmouseover="showhint('Ubah Angkatan!', this, event, '80px')"/></a>&nbsp;
            <a href="JavaScript:hapus(<?=$row['replid'] ?>)"><img src="../images/ico/hapus.png" border="0" onmouseover="showhint('Hapus Angkatan!', this, event, '80px')"/></a>
        </td>
<?		} ?>
    </tr>
<?	} 
	CloseDb(); ?>	
    
    <!-- END TABLE CONTENT -->
    </table>
    <script language='JavaScript'>
	    Tables('table', 1, 0);
    </script>	
     <?	if ($page==0){ 
		$disback="style='visibility:hidden;'";
		$disnext="style='visibility:visible;'";
		}
		if ($page<$total && $page>0){
		$disback="style='visibility:visible;'";
		$disnext="style='visibility:visible;'";
		}
		if ($page==$total-1 && $page>0){
		$disback="style='visibility:visible;'";
		$disnext="style='visibility:hidden;'";
		}
		if ($page==$total-1 && $page==0){
		$disback="style='visibility:hidden;'";
		$disnext="style='visibility:hidden;'";
		}
	?>
     </td>
</tr> 
<tr>
    <td>
    <table border="0"width="95%" align="center" cellpadding="0" cellspacing="0">	
    <tr>
       	<td width="30%" align="left">Halaman
        <select name="hal" id="hal" onChange="change_hal()">
        <?	for ($m=0; $m<$total; $m++) {?>
             <option value="<?=$m ?>" <?=IntIsSelected($hal,$m) ?>><?=$m+1 ?></option>
        <? } ?>
     	</select>
	  	dari <?=$total?> halaman
		
		<? 
     // Navigasi halaman berikutnya dan sebelumnya
        ?>
        </td>
    	<!--td align="center">
    <input <?=$disback?> type="button" class="but" name="back" value=" << " onClick="change_page('<?=(int)$page-1?>')" onMouseOver="showhint('Sebelumnya', this, event, '75px')">
		<?
		/*for($a=0;$a<$total;$a++){
			if ($page==$a){
				echo "<font face='verdana' color='red'><strong>".($a+1)."</strong></font> "; 
			} else { 
				echo "<a href='#' onClick=\"change_page('".$a."')\">".($a+1)."</a> "; 
			}
				 
	    }*/
		?>
	     <input <?=$disnext?> type="button" class="but" name="next" value=" >> " onClick="change_page('<?=(int)$page+1?>')" onMouseOver="showhint('Berikutnya', this, event, '75px')">
 		</td-->
        <td width="30%" align="right">Jumlah baris per halaman
      	<select name="varbaris" id="varbaris" onChange="change_baris()">
        <? 	for ($m=5; $m <= $akhir; $m=$m+5) { ?>
        	<option value="<?=$m ?>" <?=IntIsSelected($varbaris,$m) ?>><?=$m ?></option>
        <? 	} ?>
       
      	</select></td>
    </tr>
    </table>
    </td></tr>
<!-- END TABLE CENTER -->    
</table>
<?	} else { ?>
<td width = "70%"></td>
</tr>
</table>
<table width="95%" border="0" align="center">          
<tr>
	<td width="17%"></td>
	<td><hr style="border-style:dotted" color="#000000"/></td>
</tr>
</table>
<table width="100%" border="0" align="center">          
<tr>
	<td align="center" valign="middle" height="200">
    <? if ($departemen != "") {	?>
    	<font size = "2" color ="red"><b>Tidak ditemukan adanya data. 
        <? if (SI_USER_LEVEL() != $SI_USER_STAFF) { ?>
        <br />Klik &nbsp;<a href="JavaScript:tambah()" ><font size = "2" color ="green">di sini</font></a>&nbsp;untuk mengisi data baru. 
        <? } ?>
        </b></font>
    <? } else { ?>
		<font size = "2" color ="red"><b>Belum ada data Departemen.
        <br />Silahkan isi terlebih dahulu di menu Departemen pada bagian Referensi.
        </b></font>
    <? } ?>
	</td>
</tr>
</table>  
<? } ?>

</td></tr>
<!-- END TABLE BACKGROUND IMAGE -->
</table>    

</body>
</html>
<script language="javascript">
	var spryselect1 = new Spry.Widget.ValidationSelect("departemen");
</script>