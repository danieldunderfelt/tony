<?php namespace Dunderfelt\Tony;

use Illuminate\Database\Eloquent\Model;

class Media extends Model {

    protected $guarded = ["id", "created_at", "updated_at"];
    protected $table = "media";

    public function news()
    {
        return $this->morphedByMany('Dunderfelt\Tony\News', 'mediable');
    }

    public function books()
    {
        return $this->morphedByMany('Dunderfelt\Tony\Book', 'mediable');
    }

    public function pages()
    {
        return $this->morphedByMany('Dunderfelt\Tony\Page', 'mediable');
    }

}
