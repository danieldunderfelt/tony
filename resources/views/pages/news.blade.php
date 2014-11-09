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
                    <li>
                        <div class="img">
                            <img src="{{ asset($newsItem->media->first()->url) }}">
                        </div>
                        <article>
                            <h4>
                                {{ $newsItem->created_at->formatLocalized('%e.%m.%Y') }} - {{ trans("messages." . $newsItem->type) }}
                            </h4>
                            <p>
                                {{ $newsItem->body }}<br>
                                <a href="{{ $newsItem->cta_link }}">{{ $newsItem->cta_text }}</a>
                            </p>
                        </article>
                    </li>
                @endforeach
            </ul>
        </article>
    </section>
@stop