<section class="container mx-auto p-6 font-mono">
    <div class="w-full flex mb-4 p-2 justify-end">
        <form class="flex space-x-4 shadow bg-white rounded-md m-2 p-2">
            <div class="p-1 flex items-center">
                <label for="tmdb_id" class="block text-sm font-medium text-gray-900 mr-4">Movie TMDB ID</label>
                <input wire:model="movieTMDBId" type="text" name="tmdb_id" id="tmdb_id" autocomplete="off"
                    class="px-3 py-2 border border-gray-300 rounded">
            </div>
            <div class="p-1">
                <button type="button" wire:click="generateMovie"
                    class="inline-flex items-center justify-center py-2 px-4 border border-transparent text-base leading-6 bg-green-600 rounded text-white">Generate
                    Movie</button>
            </div>
        </form>
    </div>

    <div class="w-full mb-8 overflow-hidden rounded-lg shadow-lg">
        <div class="w-full shadow p-5 bg-white">
            <div class="relative">
                <div class="absolute flex items-center ml-2 h-full">
                    <svg class="w-4 h-4 fill-current text-primary-gray-dark" viewBox="0 0 16 16" fill="none"
                        xmlns="http://www.w3.org/2000/svg">
                        <path
                            d="M15.8898 15.0493L11.8588 11.0182C11.7869 10.9463 11.6932 10.9088 11.5932 10.9088H11.2713C12.3431 9.74952 12.9994 8.20272 12.9994 6.49968C12.9994 2.90923 10.0901 0 6.49968 0C2.90923 0 0 2.90923 0 6.49968C0 10.0901 2.90923 12.9994 6.49968 12.9994C8.20272 12.9994 9.74952 12.3431 10.9088 11.2744V11.5932C10.9088 11.6932 10.9495 11.7869 11.0182 11.8588L15.0493 15.8898C15.1961 16.0367 15.4336 16.0367 15.5805 15.8898L15.8898 15.5805C16.0367 15.4336 16.0367 15.1961 15.8898 15.0493ZM6.49968 11.9994C3.45921 11.9994 0.999951 9.54016 0.999951 6.49968C0.999951 3.45921 3.45921 0.999951 6.49968 0.999951C9.54016 0.999951 11.9994 3.45921 11.9994 6.49968C11.9994 9.54016 9.54016 11.9994 6.49968 11.9994Z">
                        </path>
                    </svg>
                </div>

                <input wire:model.live="search" type="text" placeholder="Search by Name"
                    class="px-8 py-3 w-full md:w-2/6 rounded-md bg-gray-100 border-transparent focus:border-gray-500 focus:bg-white focus:ring-0 text-sm"
                    id="search_name" />
            </div>

            <div class="flex items-center justify-between mt-4">
                <p class="font-medium">Filters</p>

                <button wire:click="resetFilters"
                    class="px-4 py-2 bg-gray-100 hover:bg-gray-200 text-gray-800 text-sm font-medium rounded-md">Reset
                    Filter</button>
            </div>

            <div>
                <div class="flex justify-between space-x-4 mt-4">
                    <select wire:model.live="sort"
                        class="px-4 py-3 w-full rounded-md bg-gray-100 border-transparent focus:border-gray-500 focus:bg-white focus:ring-0 text-sm"
                        id="sort">
                        <option value="asc">Asc</option>
                        <option value="desc">Desc</option>
                    </select>

                    <select wire:model.live="perPage"
                        class="px-4 py-3 w-full rounded-md bg-gray-100 border-transparent focus:border-gray-500 focus:bg-white focus:ring-0 text-sm"
                        id="per_page">
                        <option value="5">5 Per Page</option>
                        <option value="10">10 Per Page</option>
                        <option value="15">15 Per Page</option>
                    </select>
                </div>
            </div>
        </div>

        <div class="w-full overflow-x-auto">
            <table class="w-full">
                <thead>
                    <tr
                        class="text-md font-semibold tracking-wide text-left text-gray-900 bg-gray-100 uppercase border-b border-gray-600">
                        <th class="px-4 py-3">Title</th>
                        <th class="px-4 py-3">Runtime</th>
                        <th class="px-4 py-3">Public</th>
                        <th class="px-4 py-3">Poster</th>
                        <th class="px-4 py-3">Manage</th>
                    </tr>
                </thead>
                <tbody class="bg-white">
                    @forelse ($movies as $movie)
                        <tr class="text-gray-700">
                            <td class="px-4 py-3 border">
                                {{ $movie->title }}
                            </td>
                            <td class="px-4 py-3 text-ms font-semibold border">{{ $movie->runtime }}</td>
                            <td class="px-4 py-3 text-ms font-semibold border">{{ $movie->runtime }}</td>
                            <td class="px-4 py-3 border">
                                @if ($movie->is_public == 1)
                                    <span
                                        class="bg-green-200 text-center text-green-800 rounded-full grid font-bold">Yes</span>
                                @else
                                    <span
                                        class="bg-red-200 text-center text-red-800 rounded-full grid font-bold">No</span>
                                @endif
                            </td>
                            <td class="px-4 py-3 border">
                                <img src="https://image.tmdb.org/t/p/w500{{ $movie->poster_path }}"
                                    alt="{{ $movie->title }}" class="h-16 w-16">
                            </td>
                            <td class="px-4 py-3 text-sm border">
                                <x-m-button wire:click="showEditModal({{ $movie->id }})"
                                    class="bg-green-500 hover:bg-green-700 text-white">Edit</x-m-button>
                                <x-m-button wire:click="deleteMovie({{ $movie->id }})"
                                    class="bg-red-500 hover:bg-red-700 text-white">Delete</x-m-button>
                            </td>
                        </tr>
                    @empty
                        <tr class="text-gray-700">
                            <td colspan="6" class="text-center px-4 py-3 border">
                                Data Movie is Empty
                            </td>
                        </tr>
                    @endforelse
                </tbody>

            </table>
            <div class="m-2 p-2">
                {{ $movies->links() }}
            </div>
        </div>
    </div>
    <x-dialog-modal wire:model="showMovieModal">
        <x-slot name="title">Update Movie</x-slot>
        <x-slot name="content">
            <div class="mt-10 sm:mt-0">
                <div class="mt-5 md:mt-0 md:col-span-2">
                    <form>
                        <div class="shadow overflow-hidden sm:rounded-md">
                            < class="px-4 py-5 bg-white sm:p-6">
                                <div class="grid grid-cols-6 gap-6">
                                    <div class="col-span-6 sm:col-span-3">
                                        <label for="movie-name" class="block text-sm font-medium text-gray-700">Movie
                                            Name</label>
                                        <input wire:model="movieName" type="text" autocomplete="off" id="movie-name"
                                            class="mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md" />
                                    </div>
                                </div>
                                <div class="grid grid-cols-6 gap-6">
                                    <div class="col-span-6 sm:col-span-3">
                                        <label for="runtime"
                                            class="block text-sm font-medium text-gray-700">Runtime</label>
                                        <input wire:model="movieRuntime" type="text" autocomplete="off"
                                            id="runtime"
                                            class="mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md" />
                                    </div>
                                </div>
                                <div class="grid grid-cols-6 gap-6">
                                    <div class="col-span-6 sm:col-span-3">
                                        <label for="lang"
                                            class="block text-sm font-medium text-gray-700">Language</label>
                                        <input wire:model="movieLanguage" type="text" autocomplete="off"
                                            id="lang"
                                            class="mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md" />
                                    </div>
                                </div>
                                <div class="grid grid-cols-6 gap-6">
                                    <div class="col-span-6 sm:col-span-3">
                                        <label for="video-format"
                                            class="block text-sm font-medium text-gray-700">Format</label>
                                        <input wire:model="movieFormat" type="text" autocomplete="off"
                                            id="video-format"
                                            class="mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md" />
                                    </div>
                                </div>
                                <div class="grid grid-cols-6 gap-6">
                                    <div class="col-span-6 sm:col-span-3">
                                        <label for="rating"
                                            class="block text-sm font-medium text-gray-700">Rating</label>
                                        <input wire:model="movieRating" type="text" autocomplete="off"
                                            id="rating"
                                            class="mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md" />
                                    </div>
                                </div>
                                <div class="grid grid-cols-6 gap-6">
                                    <div class="col-span-6 sm:col-span-3">
                                        <label for="release_date"
                                            class="block text-sm font-medium text-gray-700">Release Date</label>
                                        <input wire:model="movieReleaseDate" type="text" autocomplete="off"
                                            id="release_date"
                                            class="mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md" />
                                    </div>
                                </div>
                                <div class="grid grid-cols-6 gap-6">
                                    <div class="col-span-6 sm:col-span-3">
                                        <label for="poster" class="block text-sm font-medium text-gray-700">Poster
                                            Path</label>
                                        <input wire:model="moviePosterPath" type="text" autocomplete="off"
                                            id="poster"
                                            class="mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md" />
                                    </div>
                                </div>
                                <div class="grid grid-cols-6 gap-6">
                                    <div class="col-span-6 sm:col-span-3">
                                        <label for="backdrop_poster"
                                            class="block text-sm font-medium text-gray-700">Backdrop Poster
                                            Path</label>
                                        <input wire:model="movieBackdropPosterPath" type="text" autocomplete="off"
                                            id="backdrop_poster"
                                            class="mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md" />
                                    </div>
                                </div>
                                <div class="sm:col-span-3">
                                    <label for="overview"
                                        class="block text-sm font-medium leading-6 text-gray-900">Overview</label>
                                    <div class="mt-2">
                                        <textarea wire:model="movieOverview" type="text" id="overview" autocomplete="off"
                                            class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"></textarea>
                                    </div>
                                </div>
                                <div class="grid grid-cols-6 gap-6">
                                    <div class="col-span-6 sm:col-span-3">
                                        <div class="sm:col-span-3">
                                            <div class="my-2">
                                                Public
                                                <input type="radio" value="1" id="IsPublic1"
                                                    wire:model="movieIsPublic">
                                                Yes
                                                <input type="radio" value="0" id="IsPublic2"
                                                    wire:model="movieIsPublic"> No
                                            </div>
                                        </div>
                                    </div>
                                </div>
                        </div>
                </div>
                </form>
            </div>
            </div>
        </x-slot>
        <x-slot name="footer">
            <x-m-button wire:click="hiddenMovieModal"
                class="bg-gray-600 hover:bg-gray-800 text-white mr-2">Cancel</x-m-button>
            <x-m-button wire:click="updateMovie">Update</x-m-button>
        </x-slot>
    </x-dialog-modal>
</section>
