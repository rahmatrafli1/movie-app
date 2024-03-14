<x-front-layout>
    <main class="max-w-6xl mx-auto mt-8">
        <div class="grid grid-cols-2 md:grid-cols-5 gap-3 mt-4">
            @foreach ($casts as $cast)
                <x-movie-card>
                    <x-slot name="image">
                        <a href="{{ route('casts.show', $cast->slug) }}">
                            <img src="https://media.themoviedb.org/t/p/w300_and_h450_bestv2{{ $cast->poster_path }}"
                                alt="{{ $cast->name }}">
                        </a>
                    </x-slot>
                    <a href="{{ route('casts.show', $cast->slug) }}">
                        <span class="dark:text-white">{{ $cast->name }}</span>
                    </a>
                </x-movie-card>
            @endforeach
        </div>
        <div class="flex m-2 p-2">
            {{ $casts->links() }}
        </div>
    </main>
</x-front-layout>
