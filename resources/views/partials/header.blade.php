<header>
    <section class="container">
        <a class="logo" href="/">
            <img src="{{ asset('assets/img/tony-logo.png') }}" alt="Tony Dunderfelt"/>
        </a>
        <nav class="main-nav">
            <ul>
                @foreach($topNav as $navItem)
                    <li class="@if(Session::get("current-parent") === $navItem->slug)active @endif">
                        <a href="{{{ $navItem->slug }}}">{{ empty($navItem->menu) ? $navItem->title : $navItem->menu }}</a>
                    </li>
                @endforeach
            </ul>
        </nav>
    </section>
    @if(count($subpages) > 0)
        <nav class="sub-nav">
            <ul>
                @foreach($subpages as $subnavItem)
                    <li class="@if(Session::get("current-page") === $subnavItem->slug)active @endif">
                        <a href="/{{{ $subnavItem->slug }}}">{{{ empty($subnavItem->menu) ? $subnavItem->title : $subnavItem->menu }}}</a>
                    </li>
                @endforeach
            </ul>
        </nav>
    @endif
</header>