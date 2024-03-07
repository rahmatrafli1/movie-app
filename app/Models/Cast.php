<?php

namespace App\Models;

use App\Models\Movie;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Cast extends Model
{
    use HasFactory;

    protected $fillable = ['tmdb_id', 'name', 'slug', 'poster_path'];

    public function movies()
    {
        return $this->belongsToMany(Movie::class, 'cast_movie')->latest();
    }
}
