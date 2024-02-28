<?php

namespace App\Livewire;

use App\Models\Cast;
use Livewire\Component;
use Illuminate\Support\Str;
use Livewire\WithPagination;
use Illuminate\Support\Facades\Http;

class CastIndex extends Component
{
    use WithPagination;

    protected $key = '1ad0503efe42ce09a3fc58e6c173a5da';

    public $castTMDBId;
    public $castName;
    public $castPosterPath;

    public function generateCast()
    {
        $newCast = Http::get('https://api.themoviedb.org/3/person/2?api_key=1ad0503efe42ce09a3fc58e6c173a5da')->json();

        Cast::create([
            'tmdb_id' => $newCast['id'],
            'name' => $newCast['name'],
            'slug' => Str::slug($newCast['name']),
            'poster_path' => $newCast['profile_path']
        ]);
    }

    public function render()
    {
        return view('livewire.cast-index', [
            'casts' => Cast::paginate(5)
        ]);
    }
}
