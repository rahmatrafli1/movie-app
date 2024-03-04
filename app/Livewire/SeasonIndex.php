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

    public $seasonId;
    public $seasonNumber;
    public $seasonName;
    public $seasonPosterPath;

    public $showSeasonModal = false;

    public Serie $serie;

    protected $key = '1ad0503efe42ce09a3fc58e6c173a5da';

    protected $rules = [
        'seasonName' => 'required',
        'seasonPosterPath' => 'required',
        'seasonNumber' => 'required',
    ];

    public function generateSeason()
    {
        $newSeason = Http::get('https://api.themoviedb.org/3/tv/' . $this->serie->tmdb_id . '/season/' . $this->seasonNumber . '?api_key=' . $this->key);

        if ($newSeason->ok()) {
            $season = Season::where('tmdb_id', $newSeason['id'])->first();

            if (!$season) {
                Season::create([
                    'tmdb_id' => $newSeason['id'],
                    'serie_id' => $this->serie->id,
                    'name' => $newSeason['name'],
                    'slug' => Str::slug($newSeason['name']),
                    'season_number' => $newSeason['season_number'],
                    'poster_path' => $newSeason['poster_path'] ? $newSeason['poster_path'] : $this->serie->poster_path,
                ]);

                $this->reset(['seasonNumber']);

                $this->dispatch('banner-message', style: 'success', message: 'Season created successfully!');
            } else {
                $this->dispatch('banner-message', style: 'danger', message: 'Already created Season!');
            }
        } else {
            $this->reset(['seasonNumber']);
            $this->dispatch('banner-message', style: 'danger', message: 'API Season Number is Not Found!');
        }
    }

    public function showEditModal($id)
    {
        $this->seasonId = $id;
        $this->loadSeasons();
        $this->showSeasonModal = true;
    }

    public function loadSeasons()
    {
        $seasons = Season::findOrFail($this->seasonId);
        $this->seasonName = $seasons->name;
        $this->seasonPosterPath = $seasons->poster_path;
        $this->seasonNumber = $seasons->season_number;
    }

    public function hiddenEditModal()
    {
        $this->showSeasonModal = false;
        $this->reset(['seasonName', 'seasonPosterPath', 'seasonNumber']);
        $this->resetValidation();
    }

    public function updateSeason()
    {
        $this->validate();
        $seasons = Season::findOrFail($this->seasonId);
        $seasons->update([
            'name' => $this->seasonName,
            'slug' => Str::slug($this->seasonName),
            'season_number' => $this->seasonNumber,
            'poster_path' => $this->seasonPosterPath
        ]);

        $this->showSeasonModal = false;
        $this->reset(['seasonName', 'seasonPosterPath', 'seasonNumber']);
        $this->resetValidation();

        $this->dispatch('banner-message', style: 'success', message: 'Season updated successfully!');
    }

    public function deleteSeason($id)
    {
        Season::findOrFail($id)->delete();
        $this->dispatch('banner-message', style: 'success', message: 'Season deleted successfully!');
    }

    public function resetFilters()
    {
        $this->reset(['search', 'sort', 'perPage']);
    }

    public function render()
    {
        return view('livewire.season-index', [
            'seasons' => Season::where('serie_id', $this->serie->id)->search('name', $this->search)->orderBy('name', $this->sort)->paginate($this->perPage)
        ]);
    }
}
