<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Episode extends Model
{
    use HasFactory;

    protected $fillable = ['tmdb_id', 'season_id', 'name', 'episode_number', 'slug', 'overview', 'is_public', 'visits'];

    public function season()
    {
        return $this->belongsTo(Season::class);
    }

    public function trailers()
    {
        return $this->morphMany(Trailer::class, 'trailerable');
    }
}
