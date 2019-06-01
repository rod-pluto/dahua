@extends('layouts.web')

@section('content')

<!-- featured -->
@include('web.includes.featured')

<!-- Cursos -->
@include('web.includes.courses')

<!-- Quem Somos -->
<section id="quemsomos">
    <div class="container">
        <div class="row">
            <div class="col-12 col-lg-5">
                <span class="tag text-uppercase secondary-font text-uppercase">Projetos</span>
                <h3 class="text-bold primary-font primary-color">Cadastre seu projeto aqui</h3>

                <div class="img rounded">
                    <img width="1587" height="562" src="{{ asset('img') }}/quem-somos.png" class="attachment-post-thumbnail size-post-thumbnail wp-post-image" alt="" srcset="http://agilezando.com.br/fyi/wp-content/uploads/2019/03/quem-somos.png 1587w, http://agilezando.com.br/fyi/wp-content/uploads/2019/03/quem-somos-300x106.png 300w, http://agilezando.com.br/fyi/wp-content/uploads/2019/03/quem-somos-768x272.png 768w, http://agilezando.com.br/fyi/wp-content/uploads/2019/03/quem-somos-1024x363.png 1024w" sizes="(max-width: 1587px) 100vw, 1587px"> </div>

                <p class="secondary-font">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of</p>

                <a class="all text-bold" href="#projetos">Cadastre agora</a>
            </div>

            <div class="col-12 col-lg-7 universidades">
                <span class="tag text-uppercase secondary-font text-uppercase">Marketing</span>
                <h3 class="text-bold primary-font primary-color">Conheça nossa central de materiais de divulgação</h3>

                <div class="row lista">
                    <div class="col-6 col-lg-4">
                        <div class="universidade rounded" style="background-image:url(http://agilezando.com.br/fyi/wp-content/uploads/2019/03/universidade.png;">

                        </div>
                    </div>
                    <div class="col-6 col-lg-4">
                        <div class="universidade rounded" style="background-image:url(http://agilezando.com.br/fyi/wp-content/uploads/2019/03/universidade.png;">

                        </div>
                    </div>
                    <div class="col-6 col-lg-4">
                        <div class="universidade rounded" style="background-image:url(http://agilezando.com.br/fyi/wp-content/uploads/2019/03/universidade.png;">

                        </div>
                    </div>
                    <div class="col-6 col-lg-4">
                        <div class="universidade rounded" style="background-image:url(http://agilezando.com.br/fyi/wp-content/uploads/2019/03/universidade.png;">

                        </div>
                    </div>
                </div>

                <p class="secondary-font">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of</p>

                <a class="all text-bold" href="#materiais">Veja mais</a>
            </div>
        </div>
    </div>
</section>

<!-- tv -->
@include('web.includes.videos')

<!-- Blog -->
@include('web.includes.blog')
@stop
