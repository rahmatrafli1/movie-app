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
                    class="inline-flex items-center justify-center py-2 px-4 border border-transparent text-base leading-6 bg-green-600 rounded text-white">
                    <svg wire:loading wire:target="generateMovie" class="animate-spin -ml-1 mr-3 h-5 w-5 text-white"
                        xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
                        <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor"
                            stroke-width="4"></circle>
                        <path class="opacity-75" fill="currentColor"
                            d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z">
                        </path>
                    </svg>
                    Generate Movie
                </button>
            </div>
        </form>
    </div>

    <div class="w-full mb-8 overflow-hidden rounded-lg shadow-lg">
        <div class="w-full shadow p-5 bg-white">
            <div>
                <div class="flex justify-between">
                    <div class="flex-1">
                        <div class="relative">
                            <div class="absolute flex items-center ml-2 h-full">
                                <svg class="w-4 h-4 fill-current text-primary-gray-dark" viewBox="0 0 16 16"
                                    fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path
                                        d="M15.8898 15.0493L11.8588 11.0182C11.7869 10.9463 11.6932 10.9088 11.5932 10.9088H11.2713C12.3431 9.74952 12.9994 8.20272 12.9994 6.49968C12.9994 2.90923 10.0901 0 6.49968 0C2.90923 0 0 2.90923 0 6.49968C0 10.0901 2.90923 12.9994 6.49968 12.9994C8.20272 12.9994 9.74952 12.3431 10.9088 11.2744V11.5932C10.9088 11.6932 10.9495 11.7869 11.0182 11.8588L15.0493 15.8898C15.1961 16.0367 15.4336 16.0367 15.5805 15.8898L15.8898 15.5805C16.0367 15.4336 16.0367 15.1961 15.8898 15.0493ZM6.49968 11.9994C3.45921 11.9994 0.999951 9.54016 0.999951 6.49968C0.999951 3.45921 3.45921 0.999951 6.49968 0.999951C9.54016 0.999951 11.9994 3.45921 11.9994 6.49968C11.9994 9.54016 9.54016 11.9994 6.49968 11.9994Z">
                                    </path>
                                </svg>
                            </div>

                            <input wire:model.live="search" type="text" placeholder="Search by title"
                                class="px-8 py-3 w-full md:w-2/6 rounded-md bg-gray-100 border-transparent focus:border-gray-500 focus:bg-white focus:ring-0 text-sm"
                                id="search_name" />
                        </div>
                    </div>
                    <div class="flex">
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
        </div>

        <div class="w-full overflow-x-auto">
            <table class="w-full">
                <thead>
                    <tr
                        class="text-md font-semibold tracking-wide text-left text-gray-900 bg-gray-100 uppercase border-b border-gray-600">
                        <th class="px-4 py-3 cursor-pointer" wire:click="sortByColumn('title')">
                            <div class="flex space-x-4 content-center">
                                <span>Title</span>
                                @if ($sortBycolumn == 'title' && $sort == 'desc')
                                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                        stroke-width="1.5" stroke="currentColor" class="w-5 h-5 text-green-500">
                                        <path stroke-linecap="round" stroke-linejoin="round"
                                            d="M15.75 17.25 12 21m0 0-3.75-3.75M12 21V3" />
                                    </svg>
                                @elseif($sortBycolumn == 'title' && $sort == 'asc')
                                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                        stroke-width="1.5" stroke="currentColor" class="w-5 h-5 text-red-500">
                                        <path stroke-linecap="round" stroke-linejoin="round"
                                            d="M8.25 6.75 12 3m0 0 3.75 3.75M12 3v18" />
                                    </svg>
                                @endif
                            </div>
                        </th>
                        <th class="px-4 py-3 cursor-pointer" wire:click="sortByColumn('rating')">
                            <div class="flex space-x-4 content-center">
                                <span>Rating</span>
                                @if ($sortBycolumn == 'rating' && $sort == 'desc')
                                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                        stroke-width="1.5" stroke="currentColor" class="w-5 h-5 text-green-500">
                                        <path stroke-linecap="round" stroke-linejoin="round"
                                            d="M15.75 17.25 12 21m0 0-3.75-3.75M12 21V3" />
                                    </svg>
                                @elseif($sortBycolumn == 'rating' && $sort == 'asc')
                                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                        stroke-width="1.5" stroke="currentColor" class="w-5 h-5 text-red-500">
                                        <path stroke-linecap="round" stroke-linejoin="round"
                                            d="M8.25 6.75 12 3m0 0 3.75 3.75M12 3v18" />
                                    </svg>
                                @endif
                            </div>
                        </th>
                        <th class="px-4 py-3 cursor-pointer" wire:click="sortByColumn('visits')">
                            <div class="flex space-x-4 content-center">
                                <span>Visits</span>
                                @if ($sortBycolumn == 'visits' && $sort == 'desc')
                                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                        stroke-width="1.5" stroke="currentColor" class="w-5 h-5 text-green-500">
                                        <path stroke-linecap="round" stroke-linejoin="round"
                                            d="M15.75 17.25 12 21m0 0-3.75-3.75M12 21V3" />
                                    </svg>
                                @elseif($sortBycolumn == 'visits' && $sort == 'asc')
                                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"
                                        stroke-width="1.5" stroke="currentColor" class="w-5 h-5 text-red-500">
                                        <path stroke-linecap="round" stroke-linejoin="round"
                                            d="M8.25 6.75 12 3m0 0 3.75 3.75M12 3v18" />
                                    </svg>
                                @endif
                            </div>
                        </th>
                        <th class="px-4 py-3">Runtime</th>
                        <th class="px-4 py-3">Public</th>
                        <th class="px-4 py-3">Poster</th>
                        <th class="px-4 py-3">Manage</th>
                    </tr>
                </thead>
                <tbody class="bg-white">
                    @forelse ($movies as $lmovie)
                        <tr class="text-gray-700">
                            <td class="px-4 py-3 border">
                                <span wire:click="showMoviesDetail({{ $lmovie->id }})"
                                    class="text-blue-500 hover:text-blue-700 cursor-pointer">{{ $lmovie->title }}</span>
                            </td>
                            <td class="px-4 py-3 border">
                                {{ $lmovie->rating }}
                            </td>
                            <td class="px-4 py-3 border">
                                {{ $lmovie->visits }}
                            </td>
                            <td class="px-4 py-3 text-ms font-semibold border">
                                {{ date('H:i:s', mktime(0, $lmovie->runtime)) }}</td>
                            <td class="px-4 py-3 border">
                                @if ($lmovie->is_public == 1)
                                    <span
                                        class="bg-green-200 text-center text-green-800 rounded-full grid font-bold">Yes</span>
                                @else
                                    <span
                                        class="bg-red-200 text-center text-red-800 rounded-full grid font-bold">No</span>
                                @endif
                            </td>
                            <td class="px-4 py-3 border">
                                <img src="https://image.tmdb.org/t/p/w500{{ $lmovie->poster_path }}"
                                    alt="{{ $lmovie->title }}" class="h-16 w-16">
                            </td>
                            <td class="px-4 py-3 text-sm border">
                                <button type="button" wire:click="showTrailerModal({{ $lmovie->id }})"
                                    class="inline-flex items-center px-4 py-2 bg-blue-400 border border-transparent rounded-md font-semibold text-xs text-white uppercase tracking-widest hover:bg-blue-800 focus:bg-blue-700 active:bg-blue-900 focus:outline-none focus:ring-2 focus:ring-gray-500 focus:ring-offset-2 transition ease-in-out duration-150">Trailer</button>
                                <button type="button" wire:click="showEditModal({{ $lmovie->id }})"
                                    class="inline-flex items-center px-4 py-2 bg-yellow-400 border border-transparent rounded-md font-semibold text-xs text-white uppercase tracking-widest hover:bg-yellow-800 focus:bg-yellow-700 active:bg-yellow-900 focus:outline-none focus:ring-2 focus:ring-gray-500 focus:ring-offset-2 transition ease-in-out duration-150">Edit</button>
                                <x-m-button wire:click="deleteMovie({{ $lmovie->id }})"
                                    class="bg-red-500 hover:bg-red-700 text-white">Delete</x-m-button>
                            </td>
                        </tr>
                    @empty
                        <tr class="text-gray-700">
                            <td colspan="7" class="text-center px-4 py-3 border">
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
                <div class="mt-5 md:mt-0 md:col-span-2" x-data="{ tab: 0 }">
                    <div class="flex shadow overflow-hidden sm:rounded-md">
                        <button class="px-4 py-2 w-full" x-on:click.prevent="tab = 0">Form</button>
                        <button class="px-4 py-2 w-full" x-on:click.prevent="tab = 1">Tags</button>
                        <button class="px-4 py-2 w-full" x-on:click.prevent="tab = 2">Casts</button>
                    </div>
                    <div>
                        <div class="p-4 space-x-2" x-show="tab === 0">
                            <form>
                                <div class="shadow overflow-hidden sm:rounded-md">
                                    <div class="px-4 py-5 bg-white sm:p-6">
                                        <div class="grid grid-cols-6 gap-6">
                                            <div class="col-span-6 sm:col-span-3">
                                                <label for="movie-name"
                                                    class="block text-sm font-medium text-gray-700">Movie
                                                    Name</label>
                                                <input wire:model="movieName" type="text" autocomplete="off"
                                                    id="movie-name"
                                                    class="mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md" />
                                                @error('movieName')
                                                    <span class="text-red-600 text-sm">{{ $message }}</span>
                                                @enderror
                                            </div>
                                        </div>
                                        <div class="grid grid-cols-6 gap-6">
                                            <div class="col-span-6 sm:col-span-3">
                                                <label for="runtime"
                                                    class="block text-sm font-medium text-gray-700">Runtime</label>
                                                <input wire:model="movieRuntime" type="text" autocomplete="off"
                                                    id="runtime"
                                                    class="mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md" />
                                                @error('movieRuntime')
                                                    <span class="text-red-600 text-sm">{{ $message }}</span>
                                                @enderror
                                            </div>
                                        </div>
                                        <div class="grid grid-cols-6 gap-6">
                                            <div class="col-span-6 sm:col-span-3">
                                                <label for="lang"
                                                    class="block text-sm font-medium text-gray-700">Language</label>
                                                <input wire:model="movieLanguage" type="text" autocomplete="off"
                                                    id="lang"
                                                    class="mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md" />
                                                @error('movieLanguage')
                                                    <span class="text-red-600 text-sm">{{ $message }}</span>
                                                @enderror
                                            </div>
                                        </div>
                                        <div class="grid grid-cols-6 gap-6">
                                            <div class="col-span-6 sm:col-span-3">
                                                <label for="video-format"
                                                    class="block text-sm font-medium text-gray-700">Format</label>
                                                <input wire:model="movieFormat" type="text" autocomplete="off"
                                                    id="video-format"
                                                    class="mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md" />
                                                @error('movieFormat')
                                                    <span class="text-red-600 text-sm">{{ $message }}</span>
                                                @enderror
                                            </div>
                                        </div>
                                        <div class="grid grid-cols-6 gap-6">
                                            <div class="col-span-6 sm:col-span-3">
                                                <label for="visits"
                                                    class="block text-sm font-medium text-gray-700">Visits</label>
                                                <input wire:model="movieVisits" type="text" autocomplete="off"
                                                    id="visits"
                                                    class="mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md" />
                                                @error('movieVisits')
                                                    <span class="text-red-600 text-sm">{{ $message }}</span>
                                                @enderror
                                            </div>
                                        </div>
                                        <div class="grid grid-cols-6 gap-6">
                                            <div class="col-span-6 sm:col-span-3">
                                                <label for="rating"
                                                    class="block text-sm font-medium text-gray-700">Rating</label>
                                                <input wire:model="movieRating" type="text" autocomplete="off"
                                                    id="rating"
                                                    class="mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md" />
                                                @error('movieRating')
                                                    <span class="text-red-600 text-sm">{{ $message }}</span>
                                                @enderror
                                            </div>
                                        </div>
                                        <div class="grid grid-cols-6 gap-6">
                                            <div class="col-span-6 sm:col-span-3">
                                                <label for="release_date"
                                                    class="block text-sm font-medium text-gray-700">Release
                                                    Date</label>
                                                <input wire:model="movieReleaseDate" type="text"
                                                    autocomplete="off" id="release_date"
                                                    class="mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md" />
                                                @error('movieReleaseDate')
                                                    <span class="text-red-600 text-sm">{{ $message }}</span>
                                                @enderror
                                            </div>
                                        </div>
                                        <div class="grid grid-cols-6 gap-6">
                                            <div class="col-span-6 sm:col-span-3">
                                                <label for="poster"
                                                    class="block text-sm font-medium text-gray-700">Poster
                                                    Path</label>
                                                <input wire:model="moviePosterPath" type="text" autocomplete="off"
                                                    id="poster"
                                                    class="mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md" />
                                                @error('moviePosterPath')
                                                    <span class="text-red-600 text-sm">{{ $message }}</span>
                                                @enderror
                                            </div>
                                        </div>
                                        <div class="grid grid-cols-6 gap-6">
                                            <div class="col-span-6 sm:col-span-3">
                                                <label for="backdrop_poster"
                                                    class="block text-sm font-medium text-gray-700">Backdrop Poster
                                                    Path</label>
                                                <input wire:model="movieBackdropPosterPath" type="text"
                                                    autocomplete="off" id="backdrop_poster"
                                                    class="mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md" />
                                                @error('movieBackdropPosterPath')
                                                    <span class="text-red-600 text-sm">{{ $message }}</span>
                                                @enderror
                                            </div>
                                        </div>
                                        <div class="sm:col-span-3">
                                            <label for="overview"
                                                class="block text-sm font-medium leading-6 text-gray-900">Overview</label>
                                            <div class="mt-2">
                                                <textarea wire:model="movieOverview" type="text" id="overview" autocomplete="off"
                                                    class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"></textarea>
                                                @error('movieOverview')
                                                    <span class="text-red-600 text-sm">{{ $message }}</span>
                                                @enderror
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
                        <div class="p-4 space-x-2" x-show="tab === 1">
                            @if ($movie)
                                <livewire:movie-tag :movie="$movie" />
                            @endif
                        </div>
                        <div class="p-4 space-x-2" x-show="tab === 2">
                            @if ($movie)
                                <livewire:movie-cast :movie="$movie" />
                            @endif
                        </div>
                    </div>
                </div>
            </div>
        </x-slot>
        <x-slot name="footer">
            <button wire:click="hiddenMovieModal"
                class="inline-flex items-center px-4 py-2 bg-gray-700 border border-transparent rounded-md font-semibold text-xs text-white uppercase tracking-widest hover:bg-gray-800 focus:bg-gray-700 active:bg-gray-900 focus:outline-none focus:ring-2 focus:ring-gray-500 focus:ring-offset-2 transition ease-in-out duration-150 mr-2"
                type="button">Cancel</button>
            <x-m-button wire:click="updateMovie">Update</x-m-button>
        </x-slot>
    </x-dialog-modal>
    <x-dialog-modal wire:model="showTrailer">
        <x-slot name="title">Trailer Movie</x-slot>
        <x-slot name="content">
            @if ($movie)
                <div class="flex space-x-4 space-y-2 m-2">
                    @foreach ($movie->trailers as $trailer)
                        <x-button wire:click="deleteTrailer({{ $trailer->id }})" class="hover:bg-red-500">
                            {{ $trailer->name }}
                        </x-button>
                    @endforeach
                </div>
            @endif
            <div class="mt-10 sm:mt-0">
                <div class="mt-5 md:mt-0 md:col-span-2">
                    <form>
                        <div class="shadow overflow-hidden sm:rounded-md">
                            <div class="px-4 py-5 bg-white sm:p-6">
                                <div class="grid grid-cols-6 gap-6">
                                    <div class="col-span-6 sm:col-span-3">
                                        <label for="trailer-name"
                                            class="block text-sm font-medium text-gray-700">Trailer
                                            Name</label>
                                        <input wire:model="trailerName" type="text" autocomplete="off"
                                            id="trailer-name"
                                            class="mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md" />
                                        @error('trailerName')
                                            <span class="text-red-600 text-sm">{{ $message }}</span>
                                        @enderror
                                    </div>
                                </div>
                                <div class="grid grid-cols-6 gap-6">
                                    <div class="col-span-6 sm:col-span-3">
                                        <label for="embed-html" class="block text-sm font-medium text-gray-700">Embed
                                            HTML</label>
                                        <input wire:model="trailerEmbedHTML" type="text" autocomplete="off"
                                            id="embed-html"
                                            class="mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md" />
                                        @error('trailerEmbedHTML')
                                            <span class="text-red-600 text-sm">{{ $message }}</span>
                                        @enderror
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </x-slot>
        <x-slot name="footer">
            <button wire:click="hiddenMovieModal"
                class="inline-flex items-center px-4 py-2 bg-gray-700 border border-transparent rounded-md font-semibold text-xs text-white uppercase tracking-widest hover:bg-gray-800 focus:bg-gray-700 active:bg-gray-900 focus:outline-none focus:ring-2 focus:ring-gray-500 focus:ring-offset-2 transition ease-in-out duration-150 mr-2"
                type="button">Cancel</button>
            <x-m-button wire:click="addTrailer">Add Trailer</x-m-button>
        </x-slot>
    </x-dialog-modal>
    <x-dialog-modal wire:model="showMovieDetail">
        <x-slot name="title">Movie Detail</x-slot>
        <x-slot name="content">
            <div class="mt-10 sm:mt-0">
                <div class="mt-5 md:mt-0 md:col-span-2">
                    @if ($movie)
                        {{ $movie->title }}
                    @endif
                </div>
            </div>
        </x-slot>
        <x-slot name="footer">
            <button wire:click="hiddenMovieModal"
                class="inline-flex items-center px-4 py-2 bg-gray-700 border border-transparent rounded-md font-semibold text-xs text-white uppercase tracking-widest hover:bg-gray-800 focus:bg-gray-700 active:bg-gray-900 focus:outline-none focus:ring-2 focus:ring-gray-500 focus:ring-offset-2 transition ease-in-out duration-150 mr-2"
                type="button">Back</button>
        </x-slot>
    </x-dialog-modal>
</section>
