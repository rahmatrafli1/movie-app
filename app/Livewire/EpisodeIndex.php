<?php

namespace App\Livewire;

use App\Models\Serie;
use App\Models\Season;
use App\Models\Episode;
use Livewire\Component;
use Illuminate\Support\Str;
use Livewire\WithPagination;
use Illuminate\Support\Facades\Http;

class EpisodeIndex extends Component
{
    use WithPagination;

    public $search = '';
    public $sort = 'asc';
    public $perPage = 5;

    public Serie $serie;
    public Season $season;

    public $episodeNumber;
    public $episodeName;
    public $episodeOverview;
    public $episodeId;
    public $episodeIsPublic;

    public $showEpisodeModal = false;

    protected $rules = [
        'episodeName' => 'required',
        'episodeNumber' => 'required|numeric',
        'episodeOverview' => 'required',
    ];

    protected $key = '1ad0503efe42ce09a3fc58e6c173a5da';

    public function generateEpisode()
    {
        $newEpisode = Http::get('https://api.themoviedb.org/3/tv/' . $this->serie->tmdb_id . '/season/' . $this->season->season_number . '/episode/' . $this->episodeNumber . '?api_key=' . $this->key);

        if ($newEpisode->ok()) {
            $episode = Episode::where('tmdb_id', $newEpisode['id'])->first();

            if (!$episode) {
                Episode::create([
                    'tmdb_id' => $newEpisode['id'],
                    'season_id' => $this->season->id,
                    'name' => $newEpisode['name'],
                    'episode_number' => $newEpisode['episode_number'],
                    'slug' => Str::slug($newEpisode['name']),
                    'overview' => $newEpisode['overview'],
                    'is_public' => 0,
                    'visits' => 1
                ]);

                $this->reset(['episodeNumber']);

                $this->dispatch('banner-message', style: 'success', message: 'Episode created successfully!');
            } else {
                $this->dispatch('banner-message', style: 'danger', message: 'Already created Episode!');
            }
        } else {
            $this->reset(['episodeNumber']);
            $this->dispatch('banner-message', style: 'danger', message: 'API Episode Number is Not Found!');
        }
    }

    public function showEditModal($id)
    {
        $this->episodeId = $id;
        $this->loadEpisodes();
        $this->showEpisodeModal = true;
    }

    public function loadEpisodes()
    {
        $episodes = Episode::findOrFail($this->episodeId);
        $this->episodeName = $episodes->name;
        $this->episodeNumber = $episodes->episode_number;
        $this->episodeOverview = $episodes->overview;
        $this->episodeIsPublic = $episodes->is_public;
    }

    public function hiddenEditModal()
    {
        $this->showEpisodeModal = false;
        $this->reset(['episodeName', 'episodeNumber', 'episodeOverview', 'episodeIsPublic']);
        $this->resetValidation();
    }

    public function updateEpisode()
    {
        $this->validate();
        $episodes = Episode::findOrFail($this->episodeId);
        $episodes->update([
            'name' => $this->episodeName,
            'slug' => Str::slug($this->episodeName),
            'episode_number' => $this->episodeNumber,
            'overview' => $this->episodeOverview,
            'is_public' => $this->episodeIsPublic
        ]);

        $this->showEpisodeModal = false;
        $this->reset(['episodeName', 'episodeNumber', 'episodeOverview', 'episodeIsPublic']);
        $this->resetValidation();

        $this->dispatch('banner-message', style: 'success', message: 'Episode updated successfully!');
    }

    public function deleteEpisode($id)
    {
        Episode::findOrFail($id)->delete();
        $this->dispatch('banner-message', style: 'success', message: 'Episode deleted successfully!');
    }

    public function resetFilters()
    {
        $this->reset(['search', 'sort', 'perPage']);
    }

    public function render()
    {
        return view('livewire.episode-index', [
            'episodes' => Episode::where('season_id', $this->season->id)->search('name', $this->search)->orderBy('episode_number', $this->sort)->paginate($this->perPage)
        ]);
    }
}
