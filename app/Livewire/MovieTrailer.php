<?php

namespace App\Livewire;

use Livewire\Component;

class MovieTrailer extends Component
{
    public $showMovieEmbedModal = false;
    public $trailer;

    public function mount($trailer)
    {
        $this->trailer = $trailer;
    }

    public function showMovieTrailer()
    {
        $this->showMovieEmbedModal = true;
    }

    public function hiddenMovieTrailerModal()
    {
        $this->reset('showMovieEmbedModal');
    }

    public function render()
    {
        return view('livewire.movie-trailer');
    }
}
