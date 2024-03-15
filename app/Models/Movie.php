<?php

namespace App\Models;

use Spatie\Searchable\Searchable;
use Spatie\Searchable\SearchResult;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\MorphToMany;

class Movie extends Model implements Searchable
{
    use HasFactory;

    protected $dates = ['*'];

    protected $fillable = ['tmdb_id', 'title', 'release_date', 'runtime', 'lang', 'video_format', 'visits', 'is_public', 'slug', 'rating', 'poster_path', 'backdrop_path', 'overview'];

    public function getSearchResult(): SearchResult
    {
        $url = route('movies.show', $this->slug);

        return new \Spatie\Searchable\SearchResult(
            $this,
            $this->title,
            $url
        );
    }

    public function genres()
    {
        return $this->belongsToMany(Genre::class, 'genre_movie');
    }

    public function trailers()
    {
        return $this->morphMany(Trailer::class, 'trailerable');
    }

    public function tags(): MorphToMany
    {
        return $this->morphToMany(Tag::class, 'taggable');
    }

    public function casts()
    {
        return $this->belongsToMany(Cast::class, 'cast_movie');
    }
}
