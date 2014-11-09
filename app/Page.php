<?php namespace Dunderfelt\Tony;

use Illuminate\Database\Eloquent\Model;

class Page extends Model {

    protected $guarded = ["id", "created_at", "updated_at"];

    public function media()
    {
        return $this->morphToMany('Dunderfelt\Tony\Media', 'mediable');
    }

    public function getPage($slug)
    {
        return $this->where("slug", $slug)->first();
    }

    public function getSubPages($parentId)
    {
        return $this->where("parent", $parentId)->get();
    }

    public function getSlugById($id)
    {
        return $this->where("id", $id)->pluck("slug");
    }

    public function getTopLevel()
    {
        return $this->where("parent", 0)->get();
    }
} 