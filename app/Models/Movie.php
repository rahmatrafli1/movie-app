<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Movie extends Model
{
    use HasFactory;

    protected $fillable = ['tmdb_id', 'title', 'release_date', 'runtime', 'lang', 'video_format', 'is_public', 'slug', 'rating', 'poster_path', 'backdrop_path', 'overview'];
}
