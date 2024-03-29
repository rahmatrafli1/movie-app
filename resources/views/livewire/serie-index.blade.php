<section class="container mx-auto p-6 font-mono">
    <div class="w-full flex mb-4 p-2 justify-end">
        <form class="flex space-x-4 shadow bg-white rounded-md m-2 p-2">
            <div class="p-1 flex items-center">
                <label for="series_tmdb_id" class="block text-sm font-medium text-gray-900 mr-4">Series TMDB
                    ID</label>
                <input wire:model="seriesTMDBId" type="text" name="series_tmdb_id" id="series_tmdb_id" autocomplete="off"
                    class="px-3 py-2 border border-gray-300 rounded">
            </div>
            <div class="p-1">
                <button type="button" wire:click="generateSeries"
                    class="inline-flex items-center justify-center py-2 px-4 border border-transparent text-base leading-6 bg-green-600 rounded text-white">Generate
                    Series</button>
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
                        <th class="px-4 py-3">Name</th>
                        <th class="px-4 py-3">Slug</th>
                        <th class="px-4 py-3">Action</th>
                    </tr>
                </thead>
                <tbody class="bg-white">
                    @forelse ($series as $serie)
                        <tr class="text-gray-700">
                            <td class="px-4 py-3 border">
                                {{ $serie->name }}
                            </td>
                            <td class="px-4 py-3 border font-semibold">{{ $serie->slug }}</td>
                            <td class="px-4 py-3 border">
                                <a href="{{ route('admin.seasons.index', $serie->id) }}"
                                    class="inline-flex items-center px-4 py-2 bg-slate-700 border border-transparent rounded-md font-semibold text-xs text-white uppercase tracking-widest hover:bg-slate-800 focus:bg-slate-700 focus:outline-none focus:ring-2 focus:ring-white focus:ring-offset-2 transition ease-in-out duration-150">Season</a>
                                <x-m-button wire:click="showDetailModal({{ $serie->id }})"
                                    class="bg-blue-500 hover:bg-blue-800">Show</x-m-button>
                                <x-m-button wire:click="showEditModal({{ $serie->id }})"
                                    class="bg-yellow-500 hover:bg-yellow-800">Edit</x-m-button>
                                <x-d-button wire:click="deleteSeries({{ $serie->id }})">Delete</x-d-button>
                            </td>
                        </tr>
                    @empty
                        <tr class="text-gray-700">
                            <td colspan="6" class="text-center px-4 py-3 border">
                                Data Series is Empty
                            </td>
                        </tr>
                    @endforelse
                </tbody>
            </table>
            <div class="m-2 p-2">
                {{ $series->links() }}
            </div>
        </div>
    </div>

    <x-dialog-modal wire:model.live="showSeriesModal">
        <x-slot name="title">Edit Series</x-slot>
        <form>
            <x-slot name="content">
                <div class="mt-10 sm:mt-0">
                    <div class="mt-5 md:mt-0 md:col-span-2">
                        <div class="sm:col-span-3">
                            <label for="name" class="block text-sm font-medium leading-6 text-gray-900">Name</label>
                            <div class="mt-2">
                                <input wire:model="seriesName" type="text" id="name" autocomplete="off"
                                    class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">
                            </div>
                            @error('seriesName')
                                <span class="text-red-600 text-sm">{{ $message }}</span>
                            @enderror
                        </div>
                        <div class="sm:col-span-3">
                            <label for="created_year" class="block text-sm font-medium leading-6 text-gray-900">Created
                                Year</label>
                            <div class="mt-2">
                                <input wire:model="createdYear" type="text" id="created_year" autocomplete="off"
                                    class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">
                            </div>
                            @error('createdYear')
                                <span class="text-red-600 text-sm">{{ $message }}</span>
                            @enderror
                        </div>
                        <div class="sm:col-span-3">
                            <label for="poster_path" class="block text-sm font-medium leading-6 text-gray-900">Poster
                                Path</label>
                            <div class="mt-2">
                                <input wire:model="seriesPosterPath" type="text" id="poster_path" autocomplete="off"
                                    class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">
                            </div>
                            @error('seriesPosterPath')
                                <span class="text-red-600 text-sm">{{ $message }}</span>
                            @enderror
                        </div>
                    </div>
                </div>
            </x-slot>
            <x-slot name="footer">
                <x-m-button wire:click="updateSeries" class="mx-2">Update</x-m-button>
                <x-secondary-button wire:click="hiddenEditModal">Cancel</x-secondary-button>
            </x-slot>
        </form>
    </x-dialog-modal>
    <x-dialog-modal wire:model.live="showSeriesDetailModal">
        <x-slot name="title">Detail Series</x-slot>
        <form>
            <x-slot name="content">
                <div class="mt-10 sm:mt-0">
                    <div class="mt-5 md:mt-0 md:col-span-2">
                        <div class="sm:col-span-3 flex">
                            <span class="font-bold pt-[2.5px]">Name:</span>
                            <input type="text" wire:model="seriesName" id="series_name" disabled
                                class="ml-2 border border-transparent p-0 w-full"></input>
                        </div>
                        <div class="sm:col-span-3">
                            <span class="font-bold">Date Movie:</span>
                            <input type="text" wire:model="createdYear" id="created_year_1" disabled
                                class="border border-transparent p-0"></input>
                        </div>
                    </div>
                </div>
            </x-slot>
            <x-slot name="footer">
                <x-secondary-button wire:click="hiddenEditModal">Cancel</x-secondary-button>
            </x-slot>
        </form>
    </x-dialog-modal>
</section>
