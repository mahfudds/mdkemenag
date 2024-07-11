<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    
    <style>
        body {
            margin: 0;
            padding: 0;
            overflow: hidden;
            background-color: #B5CB99;
        }

        header {
            background: linear-gradient(to bottom, black, #186F65);
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            background-color: #333;
            color: white;
            padding: 10px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            z-index: 999;
        }

        h3 {
            margin: 0;
            text-align: left;
        }

        .navbar {
            margin-right: 20px;
        }

        .navbar button {
            background-color: #186F65;
            color: white;
            border: none;
            padding: 5px 10px;
            cursor: pointer;
        }

        .navbar button:hover {
            background-color: #C84B31;
        }

        .navbar button:focus {
            outline: none;
        }

        iframe {
            width: 100%;
            height: calc(100vh - 40px);
            border: none;
            margin: 0;
            padding: 0;
            position: absolute;
            top: 60px;
        }
    </style>
</head>
<body>
    <header>
        <h3>Halaman PPDB</h3>
        <nav class="navbar">
            <button onclick="redirectToHome()">Home</button>
            <button onclick="changeIframeSource('jibas/anjungan/psb/psb.php')">Pendataan Calon Siswa</button>
            <button onclick="changeIframeSource('jibas/anjungan/psb/psb.daftar.php')">Daftar Calon Siswa</button>
            <button onclick="changeIframeSource('jibas/anjungan/psb/psb.status.php')">Status Penerimaan</button>
        </nav>
    </header>

    <iframe id="myIframe" src="jibas/anjungan/psb/psb.php" frameborder="0"></iframe>

    <script>
        function redirectToHome() {
            window.location.href = '../../';
        }

        function changeIframeSource(source) {
            document.getElementById('myIframe').src = source;
        }
    </script>
</body>
</html>
