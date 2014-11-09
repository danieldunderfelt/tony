<?php namespace Dunderfelt\Tony;

use Illuminate\Database\Eloquent\Model;

class Book extends Model {

    protected $guarded = ["id", "created_at", "updated_at"];

    public function media()
    {
        return $this->morphToMany('Dunderfelt\Tony\Media', 'mediable');
    }

}
