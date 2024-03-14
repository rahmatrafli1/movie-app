<x-front-layout>
    @if (!empty($cast))
        <main class="my-2">
            <section class="bg-gradient-to-r from-indigo-700 to-transparent">
                <div class="max-w-6xl mx-auto m-4 p-2">
                    <div class="flex">
                        <div class="w-3/12">
                            <div class="w-full">
                                <img class="w-full h-full rounded"
                                    src="https://media.themoviedb.org/t/p/w300_and_h450_bestv2{{ $cast->poster_path }}"
                                    alt="{{ $cast->name }}">
                            </div>
                        </div>
                        <div class="w-8/12">
                            <div class="m-4 p-2">
                                <h1 class="flex dark:text-white font-bold text-2xl">{{ $cast->name }}</h1>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <section class="max-w-6xl mx-auto bg-gray-200 dark:bg-gray-900 p-2 rounded">
                <div class="flex justify-between">
                    <div class="w-7/12">
                        <h1 class="flex dark:text-white font-bold text-xl">Movie</h1>
                        <div class="grid grid-cols-2 md:grid-cols-5 gap-3 mt-4">
                            @foreach ($cast->movies as $movie)
                                <x-movie-card>
                                    <x-slot name="image">
                                        <a href="{{ route('movies.show', $movie->slug) }}">
                                            <img src="https://media.themoviedb.org/t/p/w300_and_h450_bestv2{{ $movie->poster_path }}"
                                                alt="{{ $movie->title }}">
                                        </a>
                                    </x-slot>
                                    <a href="{{ route('movies.show', $movie->slug) }}">
                                        <span class="dark:text-white">{{ $movie->title }}</span>
                                    </a>
                                </x-movie-card>
                            @endforeach
                        </div>
                    </div>
                </div>
            </section>
        </main>
    @endif
</x-front-layout>
