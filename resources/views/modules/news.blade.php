<section class="front-news">
    <h2>
        <a href="ajankohtaista">
            Ajankohtaista:
        </a>
    </h2>
    <ul class="news-list">
        @foreach($news as $newsItem)
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
</section>