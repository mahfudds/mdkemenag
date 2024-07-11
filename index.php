<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <link rel="icon" href="web2/images/min1.ico" type="image/x-icon">
    <link rel="shortcut icon" href="web2/images/min1.png">
    <link rel="stylesheet" href="web2/css/bootstrap.min.css">
    <link rel="stylesheet" href="web2/css/bootstrap-select.css">
    <link rel="manifest" href="/manifest.json">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Oswald">
 
    <!-- for-mobile-apps -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="Resale Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
    Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, Sony Ericsson, Motorola web design" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!-- //for-mobile-apps -->
    <!--fonts-->
    <link href='//fonts.googleapis.com/css?family=Ubuntu+Condensed' rel='stylesheet' type='text/css'>
    <link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
    <title>MIN 1 NGAWI</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    
    
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            background-color: #F3F3F3;
            overflow: auto;
            }

        .header {
            background: linear-gradient(to bottom, #0766AD, #F3F3F3);
            color: #000;
            padding: 16px;
            text-align: center;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            z-index: 999;
            display: flex;
            align-items: center;
            flex-direction: column; /* Added to align items vertically */
        }
        
        .header img {
            height: 100px;
            margin-bottom: 10px; /* Adjusted margin-bottom */
        }
        
        .header h3 {
            margin: 0;
            text-align: center;
            color: #ed1b23;
        }
        
        .search-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            width: 100%; /* Added width to take the full width of the header */
            padding: 16px;
            background-color: #ed1b23;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            margin-top: 16px;
            border-radius: 10px;
        }
        
        .search-input {
            flex-grow: 1;
            padding: 8px;
            margin-right: 16px;
            color: #000;
        }
        .app-drawer {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 10px;
            padding: 10px;
            margin-top: 260px;
        }

        .app-item {
            background-color: #0766AD;
            border:  background-color: rgba(200, 200, 200, 0.5); /* Light gray with transparency */
            border: 1px solid rgba(200, 200, 200, 0.5); /* Border with transparency */
            border-radius: 17px;
            padding: 10px;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Adjust box-shadow */
            transition: transform 0.3s ease-in-out;
            display: flex;
            flex-direction: column;
            align-items: center;
            cursor: pointer;
        }

        .app-item img {
            /*max-width: 50px;*/
            max-height: 50px;
            margin-bottom: 8px;
        }
        
        .app-item span {
            font-size: 1rem;
            color: #fff;
        }

        .app-item:hover {
            transform: scale(1.05);
            background-color: #B2533E;
            color: #fff;
            background: linear-gradient(to bottom,  #ed1b23,#000);
        }
        h2 {
            margin-top: 0; /* Atur margin-top ke 0 */
            margin-bottom: 0; /* Atur margin-bottom ke 0 */
            font-family: Oswald;
        }
        h3 {
            margin-top: 0; /* Atur margin-top ke 0 */
            margin-bottom: 0; /* Atur margin-bottom ke 0 */
            font-family: Oswald;
        }
        .footer {
           background: linear-gradient(to bottom,  #F3F3F3,#0766AD);
            color: #000;
            padding: 16px;
            text-align: center;
            position: fixed;
            bottom: 0;
            left: 0;
            width: 100%;
        }
        .modal-header{
            background: linear-gradient(to bottom, black, #186F65);!important
        }
    </style>
</head>
<body>

    <div class="header">
    <img src="web2/images/min1.png">
    <h2>
    MIN 1 NGAWI</h2>
    <!--<div class="date-widget">January 19, 2024</div>-->
    <div class="search-bar">
        <input type="text" class="search-input" placeholder="Search..." oninput="searchApps()">
    </div>
</div>

   

    <div class="app-drawer">
       
       
        
         <a href="https://min1ngawi.sch.id/" target="_blank">
        <div class="app-item" id="website">
            <img src="web2/images/web.png" alt="App Icon 3">
            <span>Website Utama</span>
        </div>
        </a>
         <a href="https://min1ngawi.sch.id/login" target="_blank">
        <div class="app-item">
            <img src="web2/images/education.png" alt="App Icon 1">
            <span>Akademik</span>
        </div>
        </a>
         <a href="https://frontend.erkam-v2.kemenag.go.id/login" target="_blank">
        <div class="app-item" >
            <img src="web2/images/accounting.png" alt="App Icon 2">
            <span>Keuangan</span>
        </div>
         </a>
          <a href="https://buku.kemdikbud.go.id/katalog/buku-kurikulum-merdeka" target="_blank">
        <div class="app-item" >
            <img src="web2/images/library.png" alt="App Icon 3">
            <span>Perpustakaan</span>
        </div>
        </a>
         <a href="https://min1ngawi.sch.id/login" target="_blank">
        <div class="app-item" >
            <img src="web2/images/teamwork.png" alt="App Icon 1">
            <span>Kepegawaian</span>
        </div>
         </a>
         <a href="https://emis.kemenag.go.id/login" target="_blank">
        <div class="app-item" >
            <img src="web2/images/emis.png" style="width:70px" alt="App Icon 2">
            <span>EMIS</span>
        </div>
        </a>
         <a href="https://simpatika.kemenag.go.id/madrasah" target="_blank">
        <div class="app-item" >
            <img src="web2/images/simpatika.png" alt="App Icon 3">
            <span>SIMPATIKA</span>
        </div>
        </a>
        <a href="https://pipmadrasah.kemenag.go.id/" target="_blank">
        <div class="app-item" >
            <img src="web2/images/kip.jpeg" alt="App Icon 1">
            <span>PIP</span>
        </div>
        </a>
        <a href="https://adm.sipapramukajatim.or.id/" target="_blank">
        <div class="app-item" id="anjungan">
            <img src="web2/images/pramuka.png" alt="App Icon 2">
            <span>SIPA</span>
        </div>
        </a>
          <a href="https://min1ngawi.hdngawi.my.id/" target="_blank">
        <div class="app-item" id="perpustakaan">
            <img src="web2/images/score.png" alt="App Icon 3">
            <span>Rapot Digital</span>
        </div>
        </a>
        <!--<a href="https://srikandi.arsip.go.id/login">-->
        <!--<div class="app-item" id="srikandi">-->
        <!--    <img src="web2/images/srikandi.png" alt="App Icon 1">-->
        <!--    <span>Srikandi</span>-->
        <!--</div>-->
        <!--</a>-->
        <a href="https://lms.min1ngawi.sch.id/login/index.php" target="_blank">
        <div class="app-item" id="lms">
            <img src="web2/images/lesson.png" alt="App Icon 2">
            <span>LMS Madrasah</span>
        </div>
        </a>
        <!--<a href="kaldik.php">-->
        <!-- <div class="app-item" id="kalender akademik">-->
        <!--    <img src="web2/images/kaldik.png" alt="App Icon 3">-->
        <!--    <span>Kalender Akademik</span>-->
        <!--</div>-->
        <!--</a>-->
        <!--<div class="app-item" id="jadwal kelas">-->
        <!--    <img src="web2/images/jadwalkelas.png" alt="App Icon 1">-->
        <!--    <span>Jadwal Kelas</span>-->
        <!--</div>-->
        <!--<div class="app-item" id="jadwal guru">-->
        <!--    <img src="web2/images/jadwalguru.png" alt="App Icon 2">-->
        <!--    <span>Jadwal Guru</span>-->
        <!--</div>-->
        <a href="https://srikandi.arsip.go.id/auth/login" target="_blank">
        <div class="app-item" >
            <img src="web2/images/garuda.png" alt="App Icon 2">
            <span>Srikandi</span>
        </div>
        </a>
        
        <!-- Add more app items as needed -->
    </div>
    <br><br><br>
    <!-- Footer -->
<footer class="footer">
    <div class="container">
        <p>&copy; 2024 Created by Athaillah Developer, and many thanks to Jibas and Moodle</p>
    </div>
</footer>
    
    <!-- Modal for Akademik -->
    <div class="modal" id="akademikModal" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-dialog-centered modal-lg rounded shadow" role="document">
            <div class="modal-content">
                <div class="modal-header" style="background-color: #346751; color: #ECDBBA;">
                    <h2 class="modal-title">Akademik Login</h2>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body" style="background-color: #ECDBBA;">
                    <form method="post" name="form" id="form" action="jibas/akademik/redirect.php">
                        <div class="form-group">
                            <label >Username:</label>
                            <input type="text" name="username" id="username" placeholder="Nama Pengguna" class="form-control">
                        </div>
                        <div class="form-group">
                            <label >Password:</label>
                            <input type="hidden" name="passwordfake" id="passwordsfake"  value="Password" style="visibility: hidden;height: 10px" />
                            <input type="password"  class="form-control" name="password" id="passwords"placeholder="Enter your password">
                        </div>
                   
                </div>
                <div class="modal-footer" style="background-color: #346751; color: #ECDBBA;">
                    <button type="submit" class="btn btn-lg btn-danger">Login</button>
                    <button type="button" class="btn btn-lg btn-secondary" data-dismiss="modal">Close</button>
                </div>
                 </form>
            </div>
        </div>
    </div>

 <!-- Modal for keuangan -->
    <div class="modal" id="keuanganModal" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-dialog-centered modal-lg rounded shadow" role="document">
            <div class="modal-content">
                <div class="modal-header" style="background-color: #346751; color: #ECDBBA;">
                    <h2 class="modal-title">Keuangan Login</h2>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body" style="background-color: #ECDBBA;">
                    <form method="post" name="form" id="formkeuangan" action="jibas/keuangan/redirect.php">
                        <div class="form-group">
                            <label >Username:</label>
                            <input type="text" name="username" id="usernamekeuangan" placeholder="Nama Pengguna" class="form-control">
                        </div>
                        <div class="form-group">
                            <label >Password:</label>
                            <input type="hidden" name="passwordfake" id="passwordsfakekeuangan"  value="Password" style="visibility: hidden;height: 10px" />
                            <input type="password"  class="form-control" name="password" id="passwordskeuangan" placeholder="Enter your password">
                        </div>
                   
                </div>
                <div class="modal-footer" style="background-color: #346751; color: #ECDBBA;">
                    <button type="submit" class="btn btn-lg btn-danger">Login</button>
                    <button type="button" class="btn btn-lg btn-secondary" data-dismiss="modal">Close</button>
                </div>
                 </form>
            </div>
        </div>
    </div>
    
    <!-- Modal for perpustakaan -->
    <div class="modal" id="simtakaModal" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-dialog-centered modal-lg rounded shadow" role="document">
            <div class="modal-content">
                <div class="modal-header" style="background-color: #346751; color: #ECDBBA;">
                    <h2 class="modal-title">Perpustakaan Login</h2>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body" style="background-color: #ECDBBA;">
                    <form method="post" name="form" id="formsimtaka" action="jibas/simtaka/redirect.php">
                        <div class="form-group">
                            <label >Username:</label>
                            <input type="text" name="username" id="usernamesimtaka" placeholder="Nama Pengguna" class="form-control">
                        </div>
                        <div class="form-group">
                            <label >Password:</label>
                            <input type="hidden" name="passwordfake" id="passwordsfakesimtaka"  value="Password" style="visibility: hidden;height: 10px" />
                            <input type="password"  class="form-control" name="password" id="passwordssimtaka" placeholder="Enter your password">
                        </div>
                   
                </div>
                <div class="modal-footer" style="background-color: #346751; color: #ECDBBA;">
                    <button type="submit" class="btn btn-lg btn-danger">Login</button>
                    <button type="button" class="btn btn-lg btn-secondary" data-dismiss="modal">Close</button>
                </div>
                 </form>
            </div>
        </div>
    </div>
    
    <!-- Modal for Kepegawaian -->
    <div class="modal" id="kepegawaianModal" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-dialog-centered modal-lg rounded shadow" role="document">
            <div class="modal-content">
                <div class="modal-header" style="background-color: #346751; color: #ECDBBA;">
                    <h2 class="modal-title">Kepegawaian Login</h2>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body" style="background-color: #ECDBBA;">
                    <form method="post" name="form" id="formema" action="jibas/kepegawaian/redirect.php">
                        <div class="form-group">
                            <label >Username:</label>
                            <input type="text" name="username" id="usernamekepegawaian" placeholder="Nama Pengguna" class="form-control">
                        </div>
                        <div class="form-group">
                            <label >Password:</label>
                            <input type="hidden" name="passwordfake" id="passwordsfakekepegawaian"  value="Password" style="visibility: hidden;height: 10px" />
                            <input type="password"  class="form-control" name="password" id="passwordskepegawaian" placeholder="Enter your password">
                        </div>
                   
                </div>
                <div class="modal-footer" style="background-color: #346751; color: #ECDBBA;">
                    <button type="submit" class="btn btn-lg btn-danger">Login</button>
                    <button type="button" class="btn btn-lg btn-secondary" data-dismiss="modal">Close</button>
                </div>
                 </form>
            </div>
        </div>
    </div>
    
     <!-- Modal for Pelaporan -->
    <div class="modal" id="emaModal" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-dialog-centered modal-lg rounded shadow" role="document">
            <div class="modal-content">
                <div class="modal-header" style="background-color: #346751; color: #ECDBBA;">
                    <h2 class="modal-title">Pelaporan Login</h2>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body" style="background-color: #ECDBBA;">
                    <form method="post" name="form" id="formema" action="jibas/ema/redirect.php">
                        <div class="form-group">
                            <label >Username:</label>
                            <input type="text" name="username" id="usernameema" placeholder="Nama Pengguna" class="form-control">
                        </div>
                        <div class="form-group">
                            <label >Password:</label>
                            <input type="hidden" name="passwordfake" id="passwordsfakeema"  value="Password" style="visibility: hidden;height: 10px" />
                            <input type="password"  class="form-control" name="password" id="passwordsema" placeholder="Enter your password">
                        </div>
                   
                </div>
                <div class="modal-footer" style="background-color: #346751; color: #ECDBBA;">
                    <button type="submit" class="btn btn-lg btn-danger">Login</button>
                    <button type="button" class="btn btn-lg btn-secondary" data-dismiss="modal">Close</button>
                </div>
                 </form>
            </div>
        </div>
    </div>
    
    <!-- Modal for Info Guru -->
    <div class="modal" id="infoguruModal" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-dialog-centered modal-lg rounded shadow" role="document">
            <div class="modal-content">
                <div class="modal-header" style="background-color: #346751; color: #ECDBBA;">
                    <h2 class="modal-title">Info Guru Login</h2>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body" style="background-color: #ECDBBA;">
                    <form method="post" name="form" id="formema" action="jibas/infoguru/redirect.php">
                        <div class="form-group">
                            <label >Username:</label>
                            <input type="text" name="username" id="usernameinfoguru" placeholder="Nama Pengguna" class="form-control">
                        </div>
                        <div class="form-group">
                            <label >Password:</label>
                            <input type="hidden" name="passwordfake" id="passwordsfakeinfoguru"  value="Password" style="visibility: hidden;height: 10px" />
                            <input type="password"  class="form-control" name="password" id="passwordsinfoguru" placeholder="Enter your password">
                        </div>
                   
                </div>
                <div class="modal-footer" style="background-color: #346751; color: #ECDBBA;">
                    <button type="submit" class="btn btn-lg btn-danger">Login</button>
                    <button type="button" class="btn btn-lg btn-secondary" data-dismiss="modal">Close</button>
                </div>
                 </form>
            </div>
        </div>
    </div>
    
    <!-- Modal for Info Siswa -->
    <div class="modal" id="infosiswaModal" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-dialog-centered modal-lg rounded shadow" role="document">
            <div class="modal-content">
                <div class="modal-header" style="background-color: #346751; color: #ECDBBA;">
                    <h2 class="modal-title">Info Siswa Login</h2>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body" style="background-color: #ECDBBA;">
                    <form method="post" name="form" id="formema" action="jibas/infosiswa/redirect.php">
                        <div class="form-group">
                            <label >Username:</label>
                            <input type="text" name="username" id="usernameinfosiswa" placeholder="Nama Pengguna" class="form-control">
                        </div>
                        <div class="form-group">
                            <label >Password:</label>
                            <input type="hidden" name="passwordfake" id="passwordsfakeinfosiswa"  value="Password" style="visibility: hidden;height: 10px" />
                            <input type="password"  class="form-control" name="password" id="passwordsinfosiswa" placeholder="Enter your password">
                        </div>
                   
                </div>
                <div class="modal-footer" style="background-color: #346751; color: #ECDBBA;">
                    <button type="submit" class="btn btn-lg btn-danger">Login</button>
                    <button type="button" class="btn btn-lg btn-secondary" data-dismiss="modal">Close</button>
                </div>
                 </form>
            </div>
        </div>
    </div>
    
    <!-- Modal for Panduan -->
    <div class="modal" id="panduanModal" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-dialog-centered modal-lg rounded shadow" role="document">
            <div class="modal-content">
                <div class="modal-header" style="background-color: #346751; color: #ECDBBA;">
                    <h2 class="modal-title">Download Panduan</h2>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body" style="background-color: #ECDBBA;">
                    <ol style="font-size:1.5rem">
                        <a href="panduan/juknis.pdf" target="_blank"><li>Junis Madrasah Digital</li></a>
                        <a href="panduan/slide.pdf" target="_blank"><li>Materi Pemaparan</li></a>
                        <a href="panduan/akademik.pdf" target="_blank"><li>Panduan Modul Akademik</li></a>
                        <a href="panduan/keuangan.pdf" target="_blank"><li>Panduan Modul Keuangan</li></a>
                        <a href="panduan/simtaka.pdf" target="_blank"><li>Panduan Modul Perpustakaan</li></a>
                        <a href="panduan/pelaporan.pdf" target="_blank"><li>Panduan Modul Pelaporan</li></a>
                        <a href="panduan/infoguru.pdf" target="_blank"><li>Panduan Modul Info Guru</li></a>
                        <a href="panduan/infosiswa.pdf" target="_blank"><li>Panduan Modul Info Siswa</li></a>
                    </ol>
            </div>
        </div>
    </div>
    
    <script>
        function searchApps() {
            var input, filter, apps, app, i, txtValue;
            input = document.querySelector('.search-input');
            filter = input.value.toUpperCase();
            apps = document.querySelectorAll('.app-item');

            for (i = 0; i < apps.length; i++) {
                app = apps[i];
                txtValue = app.textContent || app.innerText;

                if (txtValue.toUpperCase().indexOf(filter) > -1) {
                    app.style.display = "";
                } else {
                    app.style.display = "none";
                }
            }
        }
    </script>
    <script>
    function lihatmodal() {
        // Existing searchApps function

        // Add the following code to show the modal for Akademik
        var akademikApp = document.getElementById('akademik');
        akademikApp.addEventListener('click', function() {
            $('#akademikModal').modal('show');
        });
        
        var keuanganapp = document.getElementById('keuangan');
        keuanganapp.addEventListener('click', function() {
            $('#keuanganModal').modal('show');
        });
        
        var simtakaapp = document.getElementById('perpustakaan');
        simtakaapp.addEventListener('click', function() {
            $('#emaModal').modal('show');
        });
        
        var kepegawianapp = document.getElementById('kepegawian');
        kepegawianapp.addEventListener('click', function() {
            $('#emaModal').modal('show');
        });
        
        var emaapp = document.getElementById('pelaporan');
        emaapp.addEventListener('click', function() {
            $('#emaModal').modal('show');
        });
        
        var infoguruapp = document.getElementById('infoguru');
        infoguruapp.addEventListener('click', function() {
            $('#emaModal').modal('show');
        });
        
        var infosiswaapp = document.getElementById('infosiswa');
        infosiswaapp.addEventListener('click', function() {
            $('#emaModal').modal('show');
        });
        
        var panduanapp = document.getElementById('panduan');
        panduanapp.addEventListener('click', function() {
            $('#emaModal').modal('show');
        });
       
    }
</script>
<script defer src="/src/js/material.min.js"></script>
<script src="/src/js/app.js"></script>
<script src="/src/js/feed.js"></script>
</body>
</html>
