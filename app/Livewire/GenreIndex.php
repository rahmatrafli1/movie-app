<?php

namespace App\Livewire;

use App\Models\Genre;
use Livewire\Component;
use Illuminate\Support\Str;
use Livewire\WithPagination;
use Illuminate\Support\Facades\Http;

class GenreIndex extends Component
{
    use WithPagination;

    protected $key = '1ad0503efe42ce09a3fc58e6c173a5da';

    public $genreTMDBId;
    public $genreTitle;
    public $genreId;

    public $showGenreModal = false;

    protected $rules = [
        'genreTitle' => 'required'
    ];

    public function generateGenre()
    {
        $newGenre = Http::get('https://api.themoviedb.org/3/genre/' . $this->genreTMDBId . '?api_key=' . $this->key . '')->json();

        $genre = Genre::where('tmdb_id', $newGenre['id'])->first();

        if (!$genre) {
            Genre::create([
                'tmdb_id' => $newGenre['id'],
                'title' => $newGenre['name'],
                'slug' => Str::slug($newGenre['name'])
            ]);

            $this->reset();
            Genre::latest()->paginate(5);

            $this->dispatch('banner-message', style: 'success', message: 'Genre created successfully!');
        } else {
            $this->dispatch('banner-message', style: 'danger', message: 'Already created Genre!');
        }
    }

    public function showEditModal($id)
    {
        $this->genreId = $id;
        $this->loadGenre();
        $this->showGenreModal = true;
    }

    public function loadGenre()
    {
        $genre = Genre::findOrFail($this->genreId);
        $this->genreTitle = $genre->title;
    }

    public function hiddenEditModal()
    {
        $this->showGenreModal = false;
        $this->reset();
        $this->resetValidation();
        Genre::latest()->paginate(5);
    }

    public function updateGenre()
    {
        $this->validate();
        $genre = Genre::findOrFail($this->genreId);
        $genre->update([
            'title' => $this->genreTitle,
            'slug' => Str::slug($this->genreTitle)
        ]);

        $this->showGenreModal = false;
        $this->reset();
        $this->resetValidation();
        Genre::latest()->paginate(5);

        $this->dispatch('banner-message', style: 'success', message: 'Genre updated successfully!');
    }

    public function deleteGenre($id)
    {
        Genre::findOrFail($id)->delete();
        $this->dispatch('banner-message', style: 'success', message: 'Genre deleted successfully!');
    }

    public function render()
    {
        return view('livewire.genre-index', [
            'genres' => Genre::latest()->paginate(5)
        ]);
    }
}
