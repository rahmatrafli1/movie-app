<x-front-layout>
    <main class="max-w-6xl mx-auto mt-6 min-h-screen">
        <section class="bg-gray-200 dark:bg-gray-900 mt-4 dark:text-white p-2 rounded">
            <div class="m-2 p-2 text-2xl font-bold text-indigo-600 dark:text-indigo-300">
                <h1>Movies</h1>
            </div>
            <div class="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 gap-4 rounded">
                <x-movie-card>
                    <x-slot name="image">
                        <div class="aspect-w-2 aspect-h-3">
                            <img src="https://cdn.pixabay.com/photo/2021/10/13/07/43/couple-6705694_1280.jpg"
                                alt="movies" class="object-cover" />
                            <div class="absolute left-0 top-0 h-8 w-12 bg-gray-800 text-blue-400 text-center font-bold">
                                New</div>
                        </div>
                    </x-slot>
                    <a href="/">
                        <div class="dark:text-white font-bold group-hover:text-blue-400">Movie Title</div>
                    </a>
                </x-movie-card>
            </div>
        </section>
        <section class="bg-gray-200 dark:bg-gray-900 mt-4 dark:text-white p-2 rounded">
            <div class="m-2 p-2 text-2xl font-bold text-indigo-600 dark:text-indigo-300">
                <h1>Episode</h1>
            </div>
            <div class="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 gap-4 rounded">
                Episode Cards
            </div>
        </section>
        <section class="bg-gray-200 dark:bg-gray-900 mt-4 dark:text-white p-2 rounded">
            <div class="m-2 p-2 text-2xl font-bold text-indigo-600 dark:text-indigo-300">
                <h1>Series</h1>
            </div>
            <div class="grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 gap-4 rounded">
                Serie Cards
            </div>
        </section>
    </main>
</x-front-layout>
