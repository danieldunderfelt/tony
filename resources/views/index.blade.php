<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Tony Dunderfelt</title>
<link href='http://fonts.googleapis.com/css?family=Cabin:400,700,400italic,700italic|Raleway:100,900,400,200' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="assets/css/tony.css"/>
<script src="assets/js/index.js"></script>
</head>
<body class="{{{ $page->type }}}">
    <div class="site-container">
        @include("partials/header")
        <main class="container">
            @yield("page-content")
        </main>
        <figure class="tony-bg"></figure>
    </div>
</body>
</html>
 