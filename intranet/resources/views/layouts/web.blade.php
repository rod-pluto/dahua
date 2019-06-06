<!doctype html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <title>{{ setting('site.title') }}</title>

        <meta name="robots" content="noindex,follow">
        <link rel="dns-prefetch" href="http://fonts.googleapis.com/">
        <link rel="dns-prefetch" href="http://s.w.org/">

        <link rel="stylesheet" id="wp-block-library-css" href="{{ asset('css') }}/style.min.css" type="text/css" media="all">
        <link rel="stylesheet" id="style-css" href="{{ asset('css') }}/style.css" type="text/css" media="all">
        <link rel="stylesheet" id="bootstrap-css" href="{{ asset('css') }}/bootstrap.min.css" type="text/css" media="all">
        <link rel="stylesheet" id="swiper-css" href="{{ asset('css') }}/swiper.min.css" type="text/css" media="all">
        <link rel="stylesheet" id="fyi-css" href="{{ asset('css') }}/fyi.css" type="text/css" media="all">
        <link rel="stylesheet" id="fancybox-css" href="{{ asset('css') }}/jquery.fancybox.min.css" type="text/css" media="all">
        <link rel="stylesheet" id="google-fonts-raleway-css" href="{{ asset('css') }}/css" type="text/css" media="all">
        <link rel="stylesheet" id="google-fonts-opensans-css" href="{{ asset('css') }}/css(1)" type="text/css" media="all">

        <script type="text/javascript" src="{{ asset('js') }}/jquery.min.js"></script>
        <script type="text/javascript" src="{{ asset('js') }}/bootstrap.bundle.min.js"></script>
        <script type="text/javascript" src="{{ asset('js') }}/swiper.min.js"></script>
        <script type="text/javascript" src="{{ asset('js') }}/jquery.fancybox.min.js"></script>
        <script type="text/javascript" src="{{ asset('js') }}/scripts.js"></script>
    </head>
    <body>

        @include('web.includes.top-nav')

        <!-- Main Content -->
        @yield('content')

        <!-- Footer -->

        @include('web.includes.footer')

        <!-- Scroll to Top Button (Only visible on small and extra-small screen sizes) -->
        <div class="scroll-to-top d-lg-none position-fixed ">
            <a class="js-scroll-trigger d-block text-center text-white rounded" href="http://agilezando.com.br/fyi/#page-top">
                <i class="fa fa-chevron-up"></i>
            </a>
        </div>

        <script type="text/javascript" src="{{ asset('js') }}/scripts(1).js"></script>
    </body>
</html>
