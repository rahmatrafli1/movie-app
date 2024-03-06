<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Trailer extends Model
{
    use HasFactory;

    protected $fillable = ['web_name', 'web_url'];

    public function trailerable()
    {
        return $this->morphTo();
    }
}
