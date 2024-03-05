<?php

namespace App\Livewire;

use App\Models\Tag;
use Livewire\Component;
use Illuminate\Support\Str;
use Livewire\WithPagination;

class TagIndex extends Component
{
    use WithPagination;

    public $search = '';
    public $sort = 'asc';
    public $perPage = 5;

    public $showTagModal = false;
    public $tagName;

    public $tagId;

    public function showCreateModal()
    {
        $this->showTagModal = true;
    }

    public function hiddenTagModal()
    {
        $this->showTagModal = false;
        $this->reset();
    }

    public function createTag()
    {
        Tag::create([
            'tag_name' => $this->tagName,
            'slug'     => Str::slug($this->tagName)
        ]);

        $this->reset();
        $this->showTagModal = false;

        $this->dispatch('banner-message', style: 'success', message: 'Tags created successfully!');
    }

    public function showEditModal($tagId)
    {
        $this->reset(['tagName']);
        $this->tagId = $tagId;
        $tag = Tag::find($tagId);
        $this->tagName = $tag->tag_name;
        $this->showTagModal = true;
    }

    public function updateTag()
    {
        $tag = Tag::findOrFail($this->tagId);
        $tag->update([
            'tag_name' => $this->tagName,
            'slug' => Str::slug($this->tagName)
        ]);

        $this->reset();
        $this->showTagModal = false;

        $this->dispatch('banner-message', style: 'success', message: 'Tags updated successfully!');
    }

    public function deleteTag($tagId)
    {
        $tag = Tag::findOrFail($tagId);
        $tag->delete();
        $this->reset();

        $this->dispatch('banner-message', style: 'success', message: 'Tags deleted successfully!');
    }

    public function resetFilters()
    {
        $this->reset(['search', 'sort', 'perPage']);
    }

    public function render()
    {
        return view('livewire.tag-index', [
            'tags' => Tag::search('tag_name', $this->search)->orderBy('tag_name', $this->sort)->paginate($this->perPage)
        ]);
    }
}
