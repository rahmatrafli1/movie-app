<x-front-layout>
    @if (!empty($episode))
        <main class="my-2">
            <section class="bg-gradient-to-r from-indigo-700 to-transparent">
                <div class="max-w-6xl mx-auto m-4 p-2">
                    <div class="flex">
                        <div class="w-3/12">
                            <div class="w-full">
                                <img class="w-full h-full rounded"
                                    src="https://media.themoviedb.org/t/p/w300_and_h450_bestv2{{ $episode->season->poster_path }}"
                                    alt="{{ $episode->name }}">
                            </div>
                        </div>
                        <div class="w-8/12">
                            <div class="m-4 p-2">
                                <h1 class="flex dark:text-white font-bold text-2xl">{{ $episode->name }}</h1>
                                <div class="flex p-3 dark:text-white space-x-4">
                                    <span>{{ $episode->season->name }}</span>
                                </div>
                                <div class="flex space-x-4">
                                    @foreach ($episode->trailers as $trailer)
                                        <livewire:movie-trailer :trailer="$trailer"></livewire:movie-trailer>
                                    @endforeach
                                </div>
                            </div>
                            <div class="p-4">
                                <h2 class="font-bold dark:text-white text-xl">Overview</h2>
                                <p class="dark:text-white">{{ $episode->overview }}</p>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <section class="max-w-6xl mx-auto bg-gray-200 dark:bg-gray-900 p-2 rounded">
                <div class="flex justify-between">
                    <div class="w-4/12">
                        <h1 class="flex dark:text-white font-bold text-xl">Latest Episode</h1>
                        <div class="grid grid-cols-3 gap-3">
                            @if (!empty($latestEpisode))
                                @foreach ($latestEpisode as $episode)
                                    <a href="{{ route('movies.show', $episode->slug) }}">
                                        <img class="w-full h-full rounded-lg"
                                            src="https://media.themoviedb.org/t/p/w300_and_h450_bestv2{{ $episode->episode->poster_path }}"
                                            alt="{{ $episode->name }}">
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
