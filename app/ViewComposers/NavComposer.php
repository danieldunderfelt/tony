<?php namespace Dunderfelt\Tony\ViewComposers;

use Dunderfelt\Tony\Page;
use Illuminate\Contracts\View\View;
use Illuminate\Http\Request;

class NavComposer {

    /**
     * @var Page
     */
    private $page;

    public function __construct(Page $page)
    {
        $this->page = $page;
    }

    public function compose(View $view)
    {
        $topNav = $this->page->getTopLevel();
        $view->with("topNav", $topNav);
    }
} 