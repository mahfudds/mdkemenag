function chgKrit(){
	var kriteria = document.getElementById('kriteria').value;
		document.location.href = "daftar.kembali.php?kriteria="+kriteria;
}
function chgDenda(){
	var kriteria = document.getElementById('kriteria').value;
	var denda = document.getElementById('denda').value;
		document.location.href = "daftar.kembali.php?kriteria="+kriteria+"&denda="+denda;
}
function getFresh(){
	var kriteria = document.getElementById('kriteria').value;
	//alert (kriteria);
	if (kriteria=='nip' || kriteria=='nis')
	{
		var statuspeminjam = document.getElementById('statuspeminjam').value;
		var noanggota = document.getElementById('noanggota').value;
		var nama = document.getElementById('nama').value;
		document.location.href = "daftar.kembali.php?kriteria="+kriteria+"&statuspeminjam="+statuspeminjam+"&noanggota="+noanggota+"&nama="+nama;
	} else if (kriteria=='tglkembali' || kriteria=='tglpinjam'){
		var tglAwal = document.getElementById('tglAwal').value;
		var tglAkhir = document.getElementById('tglAkhir').value;
		document.location.href = "daftar.kembali.php?kriteria="+kriteria+"&tglAwal="+tglAwal+"&tglAkhir="+tglAkhir;
	} else if (kriteria=='denda'){
		var denda = document.getElementById('denda').value;
		document.location.href = "daftar.kembali.php?kriteria="+kriteria+"&denda="+denda;
	} else {
		chgKrit();
	}
	
}
function cetak(){
	var kriteria = document.getElementById('kriteria').value;
	//alert (kriteria);
	var addr;
	if (kriteria=='nip' || kriteria=='nis')
	{
		var statuspeminjam = document.getElementById('statuspeminjam').value;
		var noanggota = document.getElementById('noanggota').value;
		var nama = document.getElementById('nama').value;
		addr = "daftar.kembali.cetak.php?kriteria="+kriteria+"&statuspeminjam="+statuspeminjam+"&noanggota="+noanggota+"&nama="+nama;
	} else if (kriteria=='tglkembali' || kriteria=='tglpinjam'){
		var tglAwal = document.getElementById('tglAwal').value;
		var tglAkhir = document.getElementById('tglAkhir').value;
		addr = "daftar.kembali.cetak.php?kriteria="+kriteria+"&tglAwal="+tglAwal+"&tglAkhir="+tglAkhir;
	} else if (kriteria=='denda'){
		var denda = document.getElementById('denda').value;
		addr = "daftar.kembali.cetak.php?kriteria="+kriteria+"&denda="+denda;
	} else {
		addr = 'daftar.kembali.cetak.php';
	}
	newWindow(addr, 'CetakDaftarPengembalian','790','650','resizable=1,scrollbars=1,status=0,toolbar=0')
}
function TakeDate(elementid){
	var addr = "../lib/cals.php?elementid="+elementid;
	newWindow(addr, 'CariTanggal','338','216','resizable=0,scrollbars=0,status=0,toolbar=0')
}
function AcceptDate(date,elementid){
	document.getElementById(elementid).value=date;
	var kriteria = document.getElementById('kriteria').value;
	var tglAwal = document.getElementById('tglAwal').value;
	var tglAkhir = document.getElementById('tglAkhir').value;
	document.location.href="../kbl/daftar.kembali.php?kriteria="+kriteria+"&tglAwal="+tglAwal+"&tglAkhir="+tglAkhir;
}
function cari(){
	var status = document.getElementById('statuspeminjam').value;
	var addr;
	if (status=='0')
	{
		addr = "../lib/pegawai.php";
	}
	if (status=='1')
	{
		addr = "../lib/siswa.php";
	}
	if (status=='2')
	{
		addr = "../lib/anggota.php";
	}
		
		newWindow(addr, 'CariPeminjam','523','425','resizable=1,scrollbars=1,status=0,toolbar=0')
}
function acceptPegawai(noanggota,nama,flag){
	var kriteria = document.getElementById('kriteria').value;
	document.location.href="../kbl/daftar.kembali.php?kriteria="+kriteria+"&noanggota="+noanggota+"&nama="+nama;
}