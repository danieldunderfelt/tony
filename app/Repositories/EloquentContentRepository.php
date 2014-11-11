<?php namespace Dunderfelt\Tony\Repositories;


use Dunderfelt\Tony\Contracts\ContentRepository;
use Dunderfelt\Tony\Media;
use Dunderfelt\Tony\News;
use Dunderfelt\Tony\Page;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;

class EloquentContentRepository implements ContentRepository {

    /**
     * @var Page
     */
    private $page;
    /**
     * @var News
     */
    private $news;
    /**
     * @var Media
     */
    private $media;

    public function __construct(Page $page, News $news, Media $media)
    {

        $this->page = $page;
        $this->news = $news;
        $this->media = $media;
    }

    public function getPage($slug)
    {
        $page = $this->page->getPage($slug);

        if(!$page) {
            throw new NotFoundHttpException("You done goofed");
        }
        $addContent = $this->getAdditionalContent($page->type);
        $subpages = $this->getSubPages($page);
        return ["page" => $page, "sub" => $subpages, "content" => $addContent];
    }

    public function getAdditionalContent($type)
    {
        $func = $type . "Provider";

        if(method_exists($this, $func)) {
            return $this->$func();
        }

        return null;
    }

    public function newsProvider()
    {
        return $this->getNews(10);
    }

    public function getSubPages($page)
    {
        $search = $page->id;

        if( (int) $page->parent !== 0) {
            $search = $page->parent;
        }

        $subpages = $this->page->getSubPages($search);
        return $subpages;
    }

    public function getSlugById($id)
    {
        return $this->page->getSlugById($id);
    }

    public function getNews($amount)
    {
        $items = $this->news->with('media')->orderBy("created_at", "desc")->paginate($amount);
        return $items;
    }
}