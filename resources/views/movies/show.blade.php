<x-front-layout>
    @if (!empty($movie))
        <main class="my-2">
            <section class="bg-gradient-to-r from-indigo-700 to-transparent">
                <div class="max-w-6xl mx-auto m-4 p-2">
                    <div class="flex">
                        <div class="w-3/12">
                            <div class="w-full">
                                <img class="w-full h-full rounded"
                                    src="https://media.themoviedb.org/t/p/w300_and_h450_bestv2{{ $movie->poster_path }}"
                                    alt="{{ $movie->title }}">
                            </div>
                        </div>
                        <div class="w-8/12">
                            <div class="m-4 p-2">
                                <h1 class="flex dark:text-white font-bold text-2xl">{{ $movie->title }}</h1>
                                <div class="flex p-3 dark:text-white space-x-4">
                                    <span>{{ $movie->release_date }}</span>
                                    <span class="ml-2 space-x-1">
                                        @foreach ($movie->genres as $genre)
                                            {{ $genre->title }},
                                        @endforeach
                                    </span>
                                    <span class="flex space-x-2">
                                        {{ date('H:i:s', mktime(0, $movie->runtime)) }}
                                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                            stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                                            <path stroke-linecap="round" stroke-linejoin="round"
                                                d="M12 6v6h4.5m4.5 0a9 9 0 1 1-18 0 9 9 0 0 1 18 0Z" />
                                        </svg>
                                    </span>
                                </div>
                                <div class="flex space-x-4">
                                    @foreach ($movie->trailers as $trailer)
                                        <livewire:movie-trailer :trailer="$trailer"></livewire:movie-trailer>
                                    @endforeach
                                </div>
                            </div>
                            <div class="p-4">
                                <h2 class="font-bold dark:text-white text-xl">Overview</h2>
                                <p class="dark:text-white">{{ $movie->overview }}</p>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <section class="max-w-6xl mx-auto bg-gray-200 dark:bg-gray-900 p-2 rounded">
                <div class="flex justify-between">
                    <div class="w-7/12">
                        <h1 class="flex dark:text-white font-bold text-xl">Movie Casts</h1>
                        <div class="grid grid-cols-2 md:grid-cols-5 gap-3 mt-4">
                            @foreach ($movie->casts as $cast)
                                <x-movie-card>
                                    <x-slot name="image">
                                        <img src="https://media.themoviedb.org/t/p/w300_and_h450_bestv2{{ $cast->poster_path }}"
                                            alt="{{ $cast->name }}">
                                    </x-slot>
                                    <span class="dark:text-white">{{ $cast->name }}</span>
                                </x-movie-card>
                            @endforeach
                        </div>
                    </div>
                    <div class="w-4/12">
                        <h1 class="flex dark:text-white font-bold text-xl">Latest Movie</h1>
                        <div class="grid grid-cols-3 gap-3">
                            @if (!empty($latestMovies))
                                @foreach ($latestMovies as $movie)
                                    <a href="{{ route('movies.show', $movie->slug) }}">
                                        <img class="w-full h-full rounded-lg"
                                            src="https://media.themoviedb.org/t/p/w300_and_h450_bestv2{{ $movie->poster_path }}"
                                            alt="{{ $movie->title }}">
                                    </a>
                                @endforeach
                            @endif
                        </div>
                    </div>
                </div>
            </section>
            <section class="max-w-6xl mx-auto bg-yellow-600 text-indigo-600 mt-6 p-2">
                @if (!empty($movie))
                    @foreach ($movie->tags as $tag)
                        <span class="font-bold hover:text-indigo-200 cursor-pointer">#{{ $tag->tag_name }}</span>
                    @endforeach
                @elseif(empty($movie))
                    <span>No Tag</span>
                @endif
            </section>
        </main>
    @endif
</x-front-layout>
