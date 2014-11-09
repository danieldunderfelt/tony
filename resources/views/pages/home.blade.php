@extends("index")
@section("page-content")
    <section class="page">
        <header>
            <h1>
                {{{ $page->title }}}
            </h1>
        </header>
        <article class="page-body">
            {!! $page->body !!}
        </article>
        @include("modules.news")
    </section>
@stop