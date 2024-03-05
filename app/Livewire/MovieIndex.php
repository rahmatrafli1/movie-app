<?php

namespace App\Livewire;

use App\Models\Movie;
use App\Models\Season;
use Livewire\Component;
use Livewire\WithPagination;

class MovieIndex extends Component
{
    use WithPagination;

    public $search = '';
    public $sort = 'asc';
    public $perPage = 5;

    public $showMovieModal = false;

    public $movieId;

    public $movieTMDBId;
    public $movieName;
    public $movieRuntime;
    public $movieLanguage;
    public $movieFormat;
    public $movieRating;
    public $movieReleaseDate;
    public $moviePosterPath;
    public $movieBackdropPosterPath;
    public $movieIsPublic;
    public $movieOverview;

    protected $key = '1ad0503efe42ce09a3fc58e6c173a5da';

    public function generateMovie()
    {
    }

    public function showCreateModal()
    {
        $this->showMovieModal = true;
    }

    public function hiddenMovieModal()
    {
        $this->showMovieModal = false;
        $this->reset();
    }

    public function resetFilters()
    {
        $this->reset(['search', 'sort', 'perPage']);
    }

    public function render()
    {
        return view('livewire.movie-index', [
            'movies' => Movie::search('title', $this->search)->orderBy('title', $this->sort)->paginate($this->perPage)
        ]);
    }
}
