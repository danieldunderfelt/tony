<?php namespace Dunderfelt\Tony;


use Illuminate\Database\Eloquent\Model;

class Page extends Model {

    public function __construct()
    {

    }

    public function getPage($slug)
    {
        return $this->where("slug", $slug)->first();
    }

    public function getTopLevel()
    {
        return $this->where("parent", 0)->select("title", "slug", "id")->get();
    }

    public function getSubPages($slug)
    {
        $parent = $this->where("slug", $slug)->pluck("parent");
        return $this->where("parent", $parent)->select("title", "slug", "id")->get();
    }
} 