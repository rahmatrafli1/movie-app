<?php

namespace App\Livewire;

use App\Models\Serie;
use App\Models\Season;
use Livewire\Component;
use Illuminate\Support\Str;
use Livewire\WithPagination;
use Illuminate\Support\Facades\Http;

class SeasonIndex extends Component
{
    use WithPagination;

    public $search = '';
    public $sort = 'asc';
    public $perPage = 5;

    public $seasonNumber;

    public Serie $serie;

    protected $key = '1ad0503efe42ce09a3fc58e6c173a5da';

    public function generateSeason()
    {
        $newSeason = Http::get('https://api.themoviedb.org/3/tv/' . $this->serie->tmdb_id . '/season/' . $this->seasonNumber . '?api_key=' . $this->key)->json();

        $season = Serie::where('tmdb_id', $newSeason['id'])->first();

        if (!$season) {
            Season::create([
                'tmdb_id' => $newSeason['id'],
                'serie_id' => $this->serie->id,
                'name' => $newSeason['name'],
                'slug' => Str::slug($newSeason['name']),
                'season_number' => $newSeason['season_number'],
                'poster_path' => $newSeason['poster_path'] ? $newSeason['poster_path'] : $this->serie->poster_path,
            ]);

            $this->reset();
            Season::paginate($this->perPage);

            $this->dispatch('banner-message', style: 'success', message: 'Season created successfully!');
        } else {
            $this->dispatch('banner-message', style: 'danger', message: 'Already created Season!');
        }
    }

    public function resetFilters()
    {
        $this->reset(['search', 'sort', 'perPage']);
    }

    public function render()
    {
        return view('livewire.season-index', [
            'seasons' => Season::search('name', $this->search)->orderBy('name', $this->sort)->paginate($this->perPage)
        ]);
    }
}
