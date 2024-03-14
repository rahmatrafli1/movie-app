<x-front-layout>
    <main class="max-w-6xl mx-auto my-6 min-h-screen">
        <section class="bg-gray-200 dark:bg-gray-900 mt-4 dark:text-white p-2 rounded">
            <div class="m-2 p-2 text-2xl font-bold text-indigo-600 dark:text-indigo-300">
                <h1>Movies</h1>
            </div>
            <div class="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 lg:grid-cols-6 gap-4 rounded">
                @foreach ($movies as $movie)
                    <x-movie-card>
                        <x-slot name="image">
                            <a href="{{ route('movies.show', $movie->slug) }}">
                                <div class="aspect-w-2 aspect-h-3">
                                    <img src="https://media.themoviedb.org/t/p/w300_and_h450_bestv2{{ $movie->poster_path }}"
                                        alt="{{ $movie->title }}" class="object-cover" />
                                    <div
                                        class="absolute x-10 left-2 top-2 h-6 w-12 group-hover:bg-gray-700 bg-gray-800 text-blue-400 text-center font-bold rounded">
                                        New</div>
                                </div>
                                <div class="absolute inset-0 z-10 bg-gradient-to-t from-black to-transparent"></div>
                                <div
                                    class="absolute inset-y-0 left-5 z-10 invisible group-hover:visible flex items-center">
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor"
                                        class="w-12 h-12 text-white bg-black rounded-full">
                                        <path fill-rule="evenodd"
                                            d="M2.25 12c0-5.385 4.365-9.75 9.75-9.75s9.75 4.365 9.75 9.75-4.365 9.75-9.75 9.75S2.25 17.385 2.25 12Zm14.024-.983a1.125 1.125 0 0 1 0 1.966l-5.603 3.113A1.125 1.125 0 0 1 9 15.113V8.887c0-.857.921-1.4 1.671-.983l5.603 3.113Z"
                                            clip-rule="evenodd" />
                                    </svg>
                                    <div
                                        class="absolute transition opacity-0 duration-500 ease-in-out transform group-hover:opacity-100 group-hover:translate-x-16 group-hover:pr-2 text-white font-bold">
                                        PLAY
                                    </div>
                                </div>
                                <div
                                    class="absolute z-10 bottom-2 left-2 text-indigo-300 text-sm font-bold group-hover:text-blue-700">
                                    @foreach ($movie->genres as $genre)
                                        {{ $genre->title }}
                                    @endforeach
                                </div>
                            </a>
                        </x-slot>
                        <a href="{{ route('movies.show', $movie->slug) }}">
                            <div class="dark:text-white font-bold group-hover:text-blue-400">{{ $movie->title }}</div>
                        </a>
                    </x-movie-card>
                @endforeach
            </div>
        </section>
        <section class="bg-gray-200 dark:bg-gray-900 mt-4 dark:text-white p-2 rounded">
            <div class="m-2 p-2 text-2xl font-bold text-indigo-600 dark:text-indigo-300">
                <h1>Episode</h1>
            </div>
            <div class="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 lg:grid-cols-6 gap-4 rounded">
                @foreach ($episodes as $episode)
                    <x-movie-card>
                        <x-slot name="image">
                            <a href="">
                                <div class="aspect-w-2 aspect-h-3">
                                    <img src="https://media.themoviedb.org/t/p/w300_and_h450_bestv2{{ $episode->season->poster_path }}"
                                        alt="{{ $episode->name }}" class="object-cover" />
                                    <div
                                        class="absolute x-10 left-2 top-2 h-6 w-12 group-hover:bg-gray-700 bg-gray-800 text-blue-400 text-center font-bold rounded">
                                        New</div>
                                </div>
                            </a>
                        </x-slot>
                        <a href="/">
                            <div class="dark:text-white font-bold group-hover:text-blue-400">{{ $episode->name }}</div>
                        </a>
                    </x-movie-card>
                @endforeach
            </div>
        </section>
        <section class="bg-gray-200 dark:bg-gray-900 mt-4 dark:text-white p-2 rounded">
            <div class="m-2 p-2 text-2xl font-bold text-indigo-600 dark:text-indigo-300">
                <h1>Series</h1>
            </div>
            <div class="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 lg:grid-cols-6 gap-4 rounded">
                @foreach ($series as $serie)
                    <x-movie-card>
                        <x-slot name="image">
                            <a href="{{ route('series.show', $serie->slug) }}">
                                <div class="aspect-w-2 aspect-h-3">
                                    <img src="https://media.themoviedb.org/t/p/w300_and_h450_bestv2{{ $serie->poster_path }}"
                                        alt="{{ $serie->name }}" class="object-cover" />
                                    <div
                                        class="absolute x-10 left-2 top-2 h-6 w-12 group-hover:bg-gray-700 bg-gray-800 text-blue-400 text-center font-bold rounded">
                                        New</div>
                                </div>
                                <div class="absolute inset-0 z-10 bg-gradient-to-t from-black to-transparent"></div>
                                <div
                                    class="absolute inset-y-0 left-5 z-10 invisible group-hover:visible flex items-center">
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor"
                                        class="w-12 h-12 text-white bg-black rounded-full">
                                        <path fill-rule="evenodd"
                                            d="M2.25 12c0-5.385 4.365-9.75 9.75-9.75s9.75 4.365 9.75 9.75-4.365 9.75-9.75 9.75S2.25 17.385 2.25 12Zm14.024-.983a1.125 1.125 0 0 1 0 1.966l-5.603 3.113A1.125 1.125 0 0 1 9 15.113V8.887c0-.857.921-1.4 1.671-.983l5.603 3.113Z"
                                            clip-rule="evenodd" />
                                    </svg>
                                    <div
                                        class="absolute transition opacity-0 duration-500 ease-in-out transform group-hover:opacity-100 group-hover:translate-x-16 group-hover:pr-2 text-white font-bold">
                                        PLAY
                                    </div>
                                </div>
                                <div
                                    class="absolute z-10 bottom-2 left-2 text-indigo-300 text-sm font-bold group-hover:text-blue-700">
                                    @if ($serie->seasons_count == 1)
                                        {{ $serie->seasons_count }} Season
                                    @else
                                        {{ $serie->seasons_count }} Seasons
                                    @endif
                                </div>
                            </a>
                        </x-slot>
                        <a href="/">
                            <div class="dark:text-white font-bold group-hover:text-blue-400">{{ $serie->name }}</div>
                        </a>
                    </x-movie-card>
                @endforeach
            </div>
        </section>
    </main>
</x-front-layout>
