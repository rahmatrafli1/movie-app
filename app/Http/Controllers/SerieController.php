<?php

namespace App\Http\Controllers;

use App\Models\Serie;
use Illuminate\Http\Request;

class SerieController extends Controller
{
    public function index()
    {
        $series = Serie::withCount('seasons')->orderBy('created_at', 'desc')->paginate(18);

        return view('series.index', compact('series'));
    }
}
