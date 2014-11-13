<li>
    <div class="wrapper">
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
    </div>
</li>