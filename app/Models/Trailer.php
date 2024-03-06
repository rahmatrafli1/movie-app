<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Trailer extends Model
{
    use HasFactory;

    protected $guarded = [];

    protected $table = 'trailers_urls';

    public function trailerable()
    {
        return $this->morphTo();
    }
}
