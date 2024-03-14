<x-front-layout>
    @if (!empty($season))
        <main class="my-2">
            <section class="bg-gradient-to-r from-indigo-700 to-transparent">
                <div class="max-w-6xl mx-auto m-4 p-2">
                    <div class="flex">
                        <div class="w-3/12">
                            <div class="w-full">
                                <img class="w-full h-full rounded"
                                    src="https://media.themoviedb.org/t/p/w300_and_h450_bestv2{{ $season->poster_path }}"
                                    alt="{{ $season->name }}">
                            </div>
                        </div>
                        <div class="w-8/12">
                            <div class="m-4 p-2">
                                <h1 class="flex dark:text-white font-bold text-2xl">{{ $season->name }}</h1>
                                <div class="flex p-3 dark:text-white space-x-4">
                                    <span>Serie: <strong>{{ $serie->name }}</strong></span>
                                    <span>Release Year:
                                        {{ \Carbon\Carbon::parse($serie->created_year)->format('Y') }}</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <section class="max-w-6xl mx-auto bg-gray-200 dark:bg-gray-900 p-2 rounded">
                <div class="flex justify-between">
                    <div class="w-7/12">
                        <h1 class="flex dark:text-white font-bold text-xl">Episodes</h1>
                        <div class="grid grid-cols-2 md:grid-cols-5 gap-3 mt-4">
                            @foreach ($season->episodes as $episode)
                                <x-movie-card>
                                    <a href="">
                                        <x-slot name="image">
                                            <img src="https://media.themoviedb.org/t/p/w300_and_h450_bestv2{{ $episode->season->poster_path }}"
                                                alt="{{ $episode->name }}">
                                        </x-slot>
                                        <span class="dark:text-white">{{ $episode->name }}</span>
                                    </a>
                                </x-movie-card>
                            @endforeach
                        </div>
                    </div>
                    <div class="w-4/12">
                        <h1 class="flex dark:text-white font-bold text-xl">Latest Season</h1>
                        <div class="grid grid-cols-3 gap-3">
                            @if (!empty($latestSeasons))
                                @foreach ($latestSeasons as $season)
                                    <a href="{{ route('season.show', [$season->serie->slug, $season->slug]) }}">
                                        <img class="w-full h-full rounded-lg"
                                            src="https://media.themoviedb.org/t/p/w300_and_h450_bestv2{{ $season->poster_path }}"
                                            alt="{{ $season->name }}">
                                    </a>
                                @endforeach
                            @endif
                        </div>
                    </div>
                </div>
            </section>
        </main>
    @endif
</x-front-layout>
