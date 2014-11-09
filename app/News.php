<?php namespace Dunderfelt\Tony;

use Illuminate\Database\Eloquent\Model;

class News extends Model {

	protected $guarded = ["id", "created_at", "updated_at"];
    protected $table = "news";

    public function media()
    {
        return $this->morphToMany('Dunderfelt\Tony\Media', 'mediable');
    }
}
