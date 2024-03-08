<x-front-layout>
    <main class="max-w-6xl mx-auto my-6 min-h-screen">
        <section class="bg-gray-200 dark:bg-gray-900 mt-4 dark:text-white p-2 rounded">
            <div class="m-2 p-2 text-2xl font-bold text-indigo-600 dark:text-indigo-300">
                <h1>Movies</h1>
            </div>
            <div class="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 gap-4 rounded">
                @foreach ($movies as $movie)
                    <x-movie-card>
                        <x-slot name="image">
                            <a href="">
                                <div class="aspect-w-2 aspect-h-3">
                                    <img src="https://media.themoviedb.org/t/p/w300_and_h450_bestv2{{ $movie->poster_path }}"
                                        alt="{{ $movie->title }}" class="object-cover" />
                                    <div
                                        class="absolute left-0 top-0 h-8 w-12 bg-gray-800 text-blue-400 text-center font-bold">
                                        New</div>
                                </div>
                            </a>
                        </x-slot>
                        <a href="/">
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
            <div class="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 gap-4 rounded">
                @foreach ($episodes as $episode)
                    <x-movie-card>
                        <x-slot name="image">
                            <a href="">
                                <div class="aspect-w-2 aspect-h-3">
                                    <img src="https://media.themoviedb.org/t/p/w300_and_h450_bestv2{{ $episode->season->poster_path }}"
                                        alt="{{ $episode->name }}" class="object-cover" />
                                    <div
                                        class="absolute left-0 top-0 h-8 w-12 bg-gray-800 text-blue-400 text-center font-bold">
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
            <div class="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 gap-4 rounded">
                @foreach ($series as $serie)
                    <x-movie-card>
                        <x-slot name="image">
                            <a href="">
                                <div class="aspect-w-2 aspect-h-3">
                                    <img src="https://media.themoviedb.org/t/p/w300_and_h450_bestv2{{ $serie->poster_path }}"
                                        alt="{{ $serie->name }}" class="object-cover" />
                                    <div
                                        class="absolute left-0 top-0 h-8 w-12 bg-gray-800 text-blue-400 text-center font-bold">
                                        New</div>
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
