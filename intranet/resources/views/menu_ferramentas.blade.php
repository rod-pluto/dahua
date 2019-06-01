<div class="menu-footer">
    <ul class="menu">
        @foreach($items as $menu_item)
            <li class="menu-item"><a href="{{ $menu_item->url }}">{{ $menu_item->title }}</a></li>
        @endforeach
    </ul>
</div>
