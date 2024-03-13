<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\MorphToMany;

class Tag extends Model
{
    use HasFactory;

    protected $fillable = ['tag_name', 'slug'];

    public function movies(): MorphToMany
    {
        return $this->morphedByMany(Movie::class, 'taggable');
    }
}
