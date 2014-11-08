@extends("index")
@section("page-content")
    <header>
        <h1>
            {{{ $page->title }}}
        </h1>
    </header>
    {!! $page->body !!}
@stop