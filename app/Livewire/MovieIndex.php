<?php

namespace App\Livewire;

use App\Models\Movie;
use Livewire\Component;
use Illuminate\Support\Str;
use Livewire\WithPagination;
use Illuminate\Support\Facades\Http;

class MovieIndex extends Component
{
    use WithPagination;

    public $search = '';
    public $sort = 'asc';
    public $sortBycolumn = 'title';
    public $perPage = 5;


    public $showMovieModal = false;

    public $movieId;

    public $movieTMDBId;
    public $movieName;
    public $movieRuntime;
    public $movieLanguage;
    public $movieFormat;
    public $movieVisits;
    public $movieRating;
    public $movieReleaseDate;
    public $moviePosterPath;
    public $movieBackdropPosterPath;
    public $movieIsPublic;
    public $movieOverview;

    protected $key = '1ad0503efe42ce09a3fc58e6c173a5da';

    protected $rules = [
        'movieName' => 'required',
        'movieRuntime' => 'required|numeric',
        'movieLanguage' => 'required',
        'movieFormat' => 'required',
        'movieVisits' => 'required|numeric',
        'movieRating' => 'required|decimal:1|numeric',
        'movieReleaseDate' => 'required|date',
        'moviePosterPath' => 'required',
        'movieOverview' => 'required'
    ];

    public function generateMovie()
    {
        $movie = Movie::where('tmdb_id', $this->movieTMDBId)->exists();

        if ($movie) {
            $this->dispatch('banner-message', style: 'danger', message: 'Movie already created!');
            return;
        }

        $url = 'https://api.themoviedb.org/3/movie/';
        $apiMovies = $url . $this->movieTMDBId . '?api_key=' . $this->key;
        $movies = Http::get($apiMovies);

        if ($movies->ok()) {
            $newMovies = $movies->json();

            Movie::create([
                'tmdb_id' => $newMovies['id'],
                'title' => $newMovies['title'],
                'release_date' => $newMovies['release_date'],
                'runtime' => $newMovies['runtime'],
                'lang' => $newMovies['original_language'],
                'is_public' => 0,
                'video_format' => 'FHD',
                'visits' => 1,
                'slug' => Str::slug($newMovies['title']),
                'rating' => 0,
                'poster_path' => $newMovies['poster_path'],
                'backdrop_path' => $newMovies['backdrop_path'],
                'overview' => $newMovies['overview']
            ]);

            $this->reset(['movieTMDBId']);

            $this->dispatch('banner-message', style: 'success', message: 'Movie created successfully!');
        } else {
            $this->dispatch('banner-message', style: 'danger', message: 'API Movie cannot found!');
        }
    }

    public function sortByColumn($column)
    {
        if ($this->sortBycolumn = $column) {
            $this->sort = $this->sort === 'asc' ? 'desc' : 'asc';
        } else {
            $this->sort = 'asc';
        }
        $this->sortBycolumn = $column;
    }

    public function showCreateModal()
    {
        $this->showMovieModal = true;
    }

    public function showEditModal($id)
    {
        $this->movieId = $id;
        $this->loadMovies();
        $this->showMovieModal = true;
    }

    public function loadMovies()
    {
        $movies = Movie::findOrFail($this->movieId);
        $this->movieName = $movies->title;
        $this->movieReleaseDate = $movies->release_date;
        $this->movieRuntime = $movies->runtime;
        $this->movieLanguage = $movies->lang;
        $this->movieIsPublic = $movies->is_public;
        $this->movieRating = $movies->rating;
        $this->movieFormat = $movies->video_format;
        $this->movieVisits = $movies->visits;
        $this->moviePosterPath = $movies->poster_path;
        $this->movieBackdropPosterPath = $movies->backdrop_path;
        $this->movieOverview = $movies->overview;
    }

    public function updateMovie()
    {
        $this->validate();
        $movies = Movie::findOrFail($this->movieId);
        $movies->update([
            'title' => $this->movieName,
            'slug' => Str::slug($this->movieName),
            'release_date' => $this->movieReleaseDate,
            'runtime' => $this->movieRuntime,
            'lang' => $this->movieLanguage,
            'is_public' => $this->movieIsPublic,
            'video_format' => $this->movieFormat,
            'visits' => $this->movieVisits,
            'rating' => $this->movieRating,
            'poster_path' => $this->moviePosterPath,
            'backdrop_path' => $this->movieBackdropPosterPath,
            'overview' => $this->movieOverview
        ]);

        $this->showMovieModal = false;
        $this->reset(['movieName', 'movieReleaseDate', 'movieRuntime', 'movieLanguage', 'movieIsPublic', 'movieFormat', 'movieRating', 'moviePosterPath', 'movieBackdropPosterPath', 'movieOverview']);
        $this->resetValidation();

        $this->dispatch('banner-message', style: 'success', message: 'Movie updated successfully!');
    }

    public function hiddenMovieModal()
    {
        $this->showMovieModal = false;
        $this->reset();
        $this->resetValidation();
    }

    public function deleteMovie($id)
    {
        Movie::findOrFail($id)->delete();
        $this->dispatch('banner-message', style: 'success', message: 'Movie deleted successfully!');
    }

    public function render()
    {
        return view('livewire.movie-index', [
            'movies' => Movie::search('title', $this->search)->orderBy($this->sortBycolumn, $this->sort)->paginate($this->perPage)
        ]);
    }
}
