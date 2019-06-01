    <nav class="navbar navbar-expand-lg fixed-top navbar-shrink" id="mainNav">
        <div class="container">
            <a class="navbar-brand js-scroll-trigger" href="#">
                <img src="{{ asset('img') }}/logo-white.png" class="logo">
            </a>

            <a class="lupa d-block d-lg-none" href="#"></a>

            <button class="navbar-toggler navbar-toggler-right bg-primary text-white rounded" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            </button>

            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav ml-auto">
                    {{ Menu::display('menu-principal', 'menu_principal') }}

                    <li class="lupa">
                        <a class="nav-link py-3 rounded-circle d-none d-lg-block" href="http://agilezando.com.br/fyi/#"></a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
