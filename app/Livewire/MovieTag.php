<?php

namespace App\Livewire;

use App\Models\Tag;
use Livewire\Component;

class MovieTag extends Component
{
    public $queryTag = '';
    public $movie;
    public $tags = [];

    public function mount($movie)
    {
        $this->movie = $movie;
    }

    public function updatedQueryTag()
    {
        $this->tags = Tag::search('tag_name', $this->queryTag)->get();
    }

    public function addTag($id)
    {
        $tag = Tag::findOrFail($id);
        $this->movie->tags()->attach($tag);
        $this->reset();
    }

    public function render()
    {
        return view('livewire.movie-tag');
    }
}
