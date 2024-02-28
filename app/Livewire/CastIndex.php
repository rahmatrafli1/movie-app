<?php

namespace App\Livewire;

use App\Models\Cast;
use Livewire\Component;
use Illuminate\Support\Str;
use Livewire\WithPagination;
use Illuminate\Support\Facades\Http;

use function Termwind\style;

class CastIndex extends Component
{
    use WithPagination;

    protected $key = '1ad0503efe42ce09a3fc58e6c173a5da';

    public $castTMDBId;
    public $castName;
    public $castPosterPath;

    public function generateCast()
    {
        $newCast = Http::get('https://api.themoviedb.org/3/person/' . $this->castTMDBId . '?api_key=' . $this->key . '')->json();

        $cast = Cast::where('tmdb_id', $newCast['id'])->first();

        if (!$cast) {
            Cast::create([
                'tmdb_id' => $newCast['id'],
                'name' => $newCast['name'],
                'slug' => Str::slug($newCast['name']),
                'poster_path' => $newCast['profile_path']
            ]);

            $this->reset();
            Cast::latest()->paginate(5);
        } else {
            $this->dispatch('banner-message', style: 'danger', message: 'Already created Cast!');
        }
    }

    public function render()
    {
        return view('livewire.cast-index', [
            'casts' => Cast::latest()->paginate(5)
        ]);
    }
}
