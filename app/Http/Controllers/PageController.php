<?php namespace Dunderfelt\Tony\Http\Controllers;

use Dunderfelt\Tony\Page;

class PageController extends Controller {

	public function index(Page $page)
	{
        $homePage = $page->getPage("tervetuloa");
		return view('pages.home', ["page" => $homePage]);
	}

    public function page(Page $page, $slug)
    {
        $getPage = $page->getPage($slug);
        return view('pages.' . $getPage->type, ["page" => $getPage]);
    }

}
