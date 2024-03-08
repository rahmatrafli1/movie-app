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
                                    <span class="ml-2">
                                        {{ $movie->runtime }}
                                    </span>
                                </div>
                                <div class="flex space-x-4">
                                    @foreach ($movie->trailers as $trailer)
                                        <button type="button"
                                            class="inline-flex items-center px-4 py-2 bg-gray-800 dark:bg-white border border-transparent rounded-md font-semibold text-xs text-white dark:text-black uppercase tracking-widest hover:bg-gray-700 hover:dark:bg-black hover:dark:text-white focus:bg-gray-700 active:bg-gray-900 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2 transition ease-in-out duration-150">{{ $trailer->name }}</button>
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
            <section class="max-w-6xl mx-auto">
                <div class="flex">
                    <div class="w-8/12">
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
                    </div>
                </div>
            </section>
        </main>
    @endif
</x-front-layout>
