<?php

namespace App\Http\Controllers;

use App\Models\Season;
use App\Models\Serie;
use Illuminate\Http\Request;

class SerieController extends Controller
{
    public function index()
    {
        $series = Serie::withCount('seasons')->orderBy('created_at', 'desc')->paginate(18);

        return view('series.index', compact('series'));
    }

    public function show(Serie $serie)
    {
        $latestSeasons = Serie::withCount('seasons')->orderBy('created_at', 'desc')->take(9)->get();
        return view('series.show', compact('serie', 'latestSeasons'));
    }

    public function showSeason(Serie $serie, Season $season)
    {
        $latestSeasons = Season::withCount('episodes')->orderBy('created_at', 'desc')->take(9)->get();
        return view('series.seasons.show', compact('serie', 'season'));
    }
}
