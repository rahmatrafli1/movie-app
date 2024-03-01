<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Season extends Model
{
    use HasFactory;

    protected $fillable = ['tmdb_id', 'serie_id', 'name', 'season_number', 'slug', 'poster_path'];
}
