<?php

namespace App\Livewire;

use App\Models\Cast;
use App\Models\Movie;
use App\Models\Serie;
use App\Models\Season;
use App\Models\Episode;
use Livewire\Component;
use Spatie\Searchable\Search as SpatieSearch;

class Search extends Component
{
    public $showSearchModal = false;
    public $search = '';
    public $searchResults = [];

    public function showSearch()
    {
        $this->showSearchModal = true;
    }

    public function hiddenSearchModal()
    {
        $this->showSearchModal = false;
        $this->reset();
    }

    public function updatedSearch()
    {
        $search1 = new SpatieSearch();
        $searchResults1 = $search1->registerModel(Movie::class, 'title')->registerModel(Serie::class, 'name')->registerModel(Cast::class, 'name')->registerModel(Episode::class, 'name')->registerModel(Season::class, 'name')->search($this->search);

        $formattedResults = $searchResults1->map(function ($result) {
            return [
                'title' => $result->title ?? $result->name,
                'url' => $result->url ?? null,
                'type' => $result->type ?? null,
            ];
        });

        $this->searchResults = $formattedResults->toArray();
    }

    public function render()
    {
        return view('livewire.search');
    }
}
