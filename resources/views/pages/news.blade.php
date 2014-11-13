@extends("index")
@section("page-content")
    <section class="page">
        <header>
            <h1>
                Ajankohtaista
            </h1>
        </header>
        <article class="page-body">
            {!! $page->body !!}
            <ul class="news-list">
                @foreach($content as $newsItem)
                    @include('partials.newsitem', ['newsItem' => $newsItem])
                @endforeach
            </ul>
        </article>
    </section>
@stop