<?php

namespace App\Http\Controllers;

use App\Models\Movie;
use Illuminate\Http\Request;

class MovieController extends Controller
{
    public function index()
    {
        echo 'Hello!';
    }

    public function show(Movie $movie)
    {
        return view('movies.show', compact('movie'));
    }
}
