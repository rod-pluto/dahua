<section id="tv">

    <div class="container">

        <div class="aeroplane"></div>

        <div class="flex">
            <div class="titles">
                <span class="tag text-uppercase secondary-font text-white">Vídeos</span>
                <h3 class="text-bold primary-font primary-color text-white">Acompanhe</h3>
                <div class="icon-yt d-none d-lg-block">
                    <span></span>
                    <a class="primary-font" href="#">Inscreva-se</a>
                </div>
            </div>

            <div class="navigation">
                <a href="#" class="prev" tabindex="0" role="button" aria-label="Previous slide"></a>
                <a href="#" class="next" tabindex="0" role="button" aria-label="Next slide"></a>
            </div>
        </div>
    </div>

    <div class="container container-slide">
        <div class="slide">
            <div class="swiper-container swiper-container-initialized swiper-container-horizontal">
                <div class="swiper-wrapper" style="transition-duration: 0ms; transform: translate3d(-1350px, 0px, 0px);">

                    @foreach( $last_videos as $index => $video )
                        <div class="swiper-slide" style="background-image: url(&quot;{{ asset('storage/'. str_replace('\\', '/',$video->image)) }}&quot;); width: 410px; margin-right: 40px;">
                            <a data-fancybox="" href="https://www.youtube.com/watch?v=sVnfv3-SeuU" class="d-flex flex-column align-items-center justify-content-end">
                                <h4 class="text-bold primary-font primary-color text-white">{{ $video->name }}</h4>
                                <span class="primary-font text-white">play</span>
                            </a>
                        </div>
                    @endforeach

                </div>
                <span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span><span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span></div>
        </div>
    </div>

    <div class="container">
        <div class="titles">
            <div class="icon-yt d-block d-lg-none">
                <a class="primary-font" href="http://agilezando.com.br/fyi/">Inscreva-se</a>
            </div>
        </div>
    </div>

</section>
