@foreach($items as $menu_item)
    <li class="nav-item mx-0 mx-lg-1 px-0 px-lg-1">
        <a class="nav-link py-3 pl-0 pr-0 rounded js-scroll-trigger primary-font" href="{{ $menu_item->url }}">{{ $menu_item->title }}</a>
    </li>
@endforeach
