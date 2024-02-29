<?php

namespace App\Livewire;

use App\Models\Serie;
use Livewire\Component;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Http;

class SerieIndex extends Component
{
    public $search = '';
    public $sort = 'asc';
    public $perPage = 5;

    public $seriesName;
    public $seriesTMDBId;

    public $showSeriesModal = false;

    protected $key = '1ad0503efe42ce09a3fc58e6c173a5da';

    public function generateSeries()
    {
        $newSerie = Http::get('https://api.themoviedb.org/3/tv/' . $this->seriesTMDBId . '?api_key=' . $this->key)->json();

        $series = Serie::where('tmdb_id', $newSerie['id'])->first();

        if (!$series) {
            Serie::create([
                'tmdb_id' => $newSerie['id'],
                'name' => $newSerie['name'],
                'slug' => Str::slug($newSerie['name']),
                'created_year' => $newSerie['first_air_date'],
                'poster_path' => $newSerie['poster_path'],
            ]);

            $this->reset();
            Serie::paginate($this->perPage);

            $this->dispatch('banner-message', style: 'success', message: 'Series created successfully!');
        } else {
            $this->dispatch('banner-message', style: 'danger', message: 'Already created Series!');
        }
    }

    public function hiddenEditModal()
    {
        $this->showSeriesModal = false;
        $this->reset();
        $this->resetValidation();
        Serie::paginate($this->perPage);
    }

    public function resetFilters()
    {
        $this->reset(['search', 'sort', 'perPage']);
    }

    public function render()
    {
        return view('livewire.serie-index', [
            'series' => Serie::search('name', $this->search)->orderBy('name', $this->sort)->paginate($this->perPage)
        ]);
    }
}
