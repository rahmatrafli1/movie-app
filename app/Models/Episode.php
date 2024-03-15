<?php

namespace App\Models;

use Spatie\Searchable\Searchable;
use Spatie\Searchable\SearchResult;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Episode extends Model implements Searchable
{
    use HasFactory;

    protected $fillable = ['tmdb_id', 'season_id', 'name', 'episode_number', 'slug', 'overview', 'is_public', 'visits'];

    public function getSearchResult(): SearchResult
    {
        $url = route('episodes.show', $this->slug);

        return new \Spatie\Searchable\SearchResult(
            $this,
            $this->name,
            $url
        );
    }

    public function season()
    {
        return $this->belongsTo(Season::class);
    }

    public function trailers()
    {
        return $this->morphMany(Trailer::class, 'trailerable');
    }
}
