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
        $latestMovies = Movie::orderBy('created_at', 'desc')->take(9)->get();
        return view('movies.show', compact('movie', 'latestMovies'));
    }
}
