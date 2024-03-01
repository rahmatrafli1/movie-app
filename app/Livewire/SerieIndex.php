<?php

namespace App\Livewire;

use App\Models\Serie;
use Livewire\Component;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Http;
use Livewire\WithPagination;

class SerieIndex extends Component
{
    use WithPagination;

    public $search = '';
    public $sort = 'asc';
    public $perPage = 5;

    public $seriesName;
    public $seriesPosterPath;
    public $createdYear;
    public $seriesTMDBId;
    public $seriesId;

    public $showSeriesModal = false;
    public $showSeriesDetailModal = false;

    protected $key = '1ad0503efe42ce09a3fc58e6c173a5da';

    protected $rules = [
        'seriesName' => 'required',
        'seriesPosterPath' => 'required',
        'createdYear' => 'required'
    ];

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

    public function showEditModal($id)
    {
        $this->seriesId = $id;
        $this->loadSeries();
        $this->showSeriesModal = true;
    }

    public function showDetailModal($id)
    {
        $this->seriesId = $id;
        $this->loadSeries();
        $this->showSeriesDetailModal = true;
    }

    public function loadSeries()
    {
        $series = Serie::findOrFail($this->seriesId);
        $this->seriesName = $series->name;
        $this->seriesPosterPath = $series->poster_path;
        $this->createdYear = $series->created_year;
    }

    public function hiddenEditModal()
    {
        $this->showSeriesModal = false;
        $this->reset();
        $this->resetValidation();
        Serie::paginate($this->perPage);
    }

    public function updateSeries()
    {
        $this->validate();
        $series = Serie::findOrFail($this->seriesId);
        $series->update([
            'name' => $this->seriesName,
            'slug' => Str::slug($this->seriesName),
            'created_year' => $this->createdYear,
            'poster_path' => $this->seriesPosterPath
        ]);

        $this->showSeriesModal = false;
        $this->reset();
        $this->resetValidation();
        Serie::paginate($this->perPage);

        $this->dispatch('banner-message', style: 'success', message: 'Series updated successfully!');
    }

    public function deleteSeries($id)
    {
        Serie::findOrFail($id)->delete();
        $this->dispatch('banner-message', style: 'success', message: 'Series deleted successfully!');
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
