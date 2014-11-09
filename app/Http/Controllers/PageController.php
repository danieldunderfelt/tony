<?php namespace Dunderfelt\Tony\Http\Controllers;

use Dunderfelt\Tony\Contracts\ContentRepository;
use Dunderfelt\Tony\Page;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;

class PageController extends Controller {

    /**
     * @var ContentRepository
     */
    private $content;

    public function __construct(ContentRepository $content)
    {
        $this->content = $content;
    }

    public function page($slug = "/")
    {
        $page = $this->content->getPage($slug);

        $this->setActiveNav($page["page"]);
        view()->share('subpages', $page["sub"]);

        return view('pages.' . $page["page"]->type, [
            "page" => $page["page"],
            "content" => $page["content"]
        ]);
    }

    private function setActiveNav($page)
    {
        $parent = $page->slug;

        if( (int) $page->parent !== 0) {
            $parent = $this->content->getSlugById($page->parent);
        }

        \Session::put("current-parent", $parent);
        \Session::put("current-page", $page->slug);
    }

}
