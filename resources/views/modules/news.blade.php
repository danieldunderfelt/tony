<section class="front-news">
    <h2>
        Uusinta uutta
    </h2>
    <ul class="news-list">
        @foreach($news as $newsItem)
            @include('partials.newsitem', ['newsItem' => $newsItem])
        @endforeach
    </ul>
</section>