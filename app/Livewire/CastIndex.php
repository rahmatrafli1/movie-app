<?php

namespace App\Livewire;

use App\Models\Cast;
use Livewire\Component;
use Illuminate\Support\Str;
use Livewire\WithPagination;
use Illuminate\Support\Facades\Http;

class CastIndex extends Component
{
    use WithPagination;

    protected $key = '1ad0503efe42ce09a3fc58e6c173a5da';

    public $castTMDBId;
    public $castName;
    public $castPosterPath;
    public $castId;

    public $showCastModal = false;

    protected $rules = [
        'castName' => 'required',
        'castPosterPath' => 'required'
    ];

    public function generateCast()
    {
        $newCast = Http::get('https://api.themoviedb.org/3/person/' . $this->castTMDBId . '?api_key=' . $this->key . '')->json();

        $cast = Cast::where('tmdb_id', $newCast['id'])->first();

        if (!$cast) {
            Cast::create([
                'tmdb_id' => $newCast['id'],
                'name' => $newCast['name'],
                'slug' => Str::slug($newCast['name']),
                'poster_path' => $newCast['profile_path']
            ]);

            $this->reset();
            Cast::latest()->paginate(5);

            $this->dispatch('banner-message', style: 'success', message: 'Cast created successfully!');
        } else {
            $this->dispatch('banner-message', style: 'danger', message: 'Already created Cast!');
        }
    }

    public function showEditModal($id)
    {
        $this->castId = $id;
        $this->loadCast();
        $this->showCastModal = true;
    }

    public function loadCast()
    {
        $cast = Cast::findOrFail($this->castId);
        $this->castName = $cast->name;
        $this->castPosterPath = $cast->poster_path;
    }

    public function hiddenEditModal()
    {
        $this->showCastModal = false;
        $this->reset();
        $this->resetValidation();
        Cast::latest()->paginate(5);
    }

    public function updateCast()
    {
        $this->validate();
        $cast = Cast::findOrFail($this->castId);
        $cast->update([
            'name' => $this->castName,
            'poster_path' => $this->castPosterPath
        ]);

        $this->showCastModal = false;
        $this->reset();
        $this->resetValidation();
        Cast::latest()->paginate(5);

        $this->dispatch('banner-message', style: 'success', message: 'Cast updated successfully!');
    }

    public function deleteCast($id)
    {
        Cast::findOrFail($id)->delete();
        $this->dispatch('banner-message', style: 'success', message: 'Cast deleted successfully!');
    }

    public function render()
    {
        return view('livewire.cast-index', [
            'casts' => Cast::latest()->paginate(5)
        ]);
    }
}
