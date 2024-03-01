<?php

namespace App\Livewire;

use App\Models\Season;
use Livewire\Component;

class SeasonIndex extends Component
{
    public $search = '';
    public $sort = 'asc';
    public $perPage = 5;

    public function render()
    {
        return view('livewire.season-index', [
            'seasons' => Season::search('name', $this->search)->orderBy('name', $this->sort)->paginate($this->perPage)
        ]);
    }
}
