<section id="cursos">
    <div class="container">
        <div class="row">
            <div class="col-12 col-md-5">
                <span class="tag text-uppercase secondary-font">Dahua Academy</span>
                <h3 class="text-bold primary-font primary-color">Conheça nossos cursos</h3>
            </div>
        </div>
    </div>

    <div class="container container-slide">
        <div class="row">
            <div class="slide">
                <div class="swiper-container swiper-container-initialized swiper-container-horizontal">
                    <div class="swiper-wrapper">

                        @foreach( $courses as $course )
                            <div class="swiper-slide" style="width: 297.5px; margin-right: 40px;">
                                <a href="http://agilezando.com.br/fyi/cursos/canada/ingles-em-toronto/" style="background-image:url(&quot;{{ asset('storage/'. str_replace('\\', '/',$course->image)) }}&quot;);">
                                    <div class="title text-white primary-font">
                                        {{ $course->name }} <span class="secondary-font">{{ $course->duration }}</span>
                                    </div>
                                    <div class="all primary-font text-bold" href="#">Saiba mais</div>
                                </a>
                            </div>
                        @endforeach

                    </div>
                    <span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span><span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
            </div>
        </div>
    </div>
</section>
