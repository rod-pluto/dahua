<section id="blog">
    <div class="container">
        <div class="row">
            <div class="col-7">
                <span class="tag text-uppercase secondary-font">Notícias e artigos Dahua</span>
                <div class="flex">
                    <h3 class="text-bold primary-font primary-color">Explore conteúdo sobre <br>tecnologia e inovação</h3>
                    <a class="all right" href="http://agilezando.com.br/fyi/blog">Ver todas as notícias</a>
                </div>
            </div>

            <div class="col-5 d-lg-flex flex-column pl-lg-0">
                <span class="tag text-uppercase secondary-font">Mural</span>
                <div class="flex">
                    <h3 class="text-bold primary-font primary-color">Mensagem<br> para você</h3>
                </div>
            </div>
        </div>

        <hr>
        <div class="row">
            <div class="col-4 col-lg-7 d-lg-flex flex-column">
                <div class="news left rounded" style="background-image:url({{ asset('storage/'.$last_blog_post->image) }});">

                    <a class="rounded" href="http://agilezando.com.br/fyi/phasellus-dui-lacus-volutpat-in-rutrum-sed-ultrices-a-purus-4/">
                        <div class="infos">
                            <div class="tag text-bold primary-font">{{ $last_blog_post->category->name}}</div>

                            <div class="date primary-font">{{ $last_blog_post->updated_at->format('d-m-Y') }}</div>

                            <h3 class="text-bold primary-font primary-color text-white">{{ $last_blog_post->title }}</h3>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col-12 col-lg-5 d-lg-flex flex-column pl-lg-0">
                <div class="news right rounded" style="background-color:#3a474f">
                    <a class="rounded" href="http://agilezando.com.br/fyi/phasellus-dui-lacus-volutpat-in-rutrum-sed-ultrices-a-purus-3/">
                        <div class="infos text-center">
                            <h4 class="text-bold primary-font primary-color text-white">{!! $last_message->body !!}</h4>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </div>
</section>
