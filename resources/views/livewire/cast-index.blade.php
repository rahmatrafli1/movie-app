<section class="container mx-auto p-6 font-mono">
    <div class="w-full flex mb-4 p-2 justify-end">
        <form class="flex space-x-4 shadow bg-white rounded-md m-2 p-2">
            <div class="p-1 flex items-center">
                <label for="cast_tmdb_id" class="block text-sm font-medium text-gray-900 mr-4">Cast TMDB
                    ID</label>
                <input wire:model="castTMDBId" type="text" name="cast_tmdb_id" id="cast_tmdb_id" autocomplete="off"
                    class="px-3 py-2 border border-gray-300 rounded">
            </div>
            <div class="p-1">
                <button type="button" wire:click="generateCast"
                    class="inline-flex items-center justify-center py-2 px-4 border border-transparent text-base leading-6 bg-green-600 rounded text-white">Generate
                    Cast</button>
            </div>
        </form>
    </div>
    <div class="w-full mb-8 overflow-hidden rounded-lg shadow-lg">
        <div class="w-full overflow-x-auto">
            <table class="w-full">
                <thead>
                    <tr
                        class="text-md font-semibold tracking-wide text-left text-gray-900 bg-gray-100 uppercase border-b border-gray-600">
                        <th class="px-4 py-3">Name</th>
                        <th class="px-4 py-3">Slug</th>
                        <th class="px-4 py-3">Poster</th>
                        <th class="px-4 py-3">Action</th>
                    </tr>
                </thead>
                <tbody class="bg-white">
                    @forelse ($casts as $cast)
                        <tr class="text-gray-700">
                            <td class="px-4 py-3 border">
                                {{ $cast->name }}
                            </td>
                            <td class="px-4 py-3 border font-semibold">{{ $cast->slug }}</td>
                            <td class="px-4 py-3 border">
                                <img class="w-12 h-12 rounded-full"
                                    src="https://image.tmdb.org/t/p/w500{{ $cast->poster_path }}"
                                    alt="{{ $cast->name }}">
                            </td>
                            <td class="px-4 py-3 border">
                                <x-m-button wire:click="showEditModal({{ $cast->id }})"
                                    class="bg-yellow-500 hover:bg-yellow-800">Edit</x-m-button>
                                <x-d-button wire:click="deleteCast({{ $cast->id }})">Delete</x-d-button>
                            </td>
                        </tr>
                    @empty
                        <tr class="text-gray-700">
                            <td colspan="4" class="text-center px-4 py-3 border">
                                Data Casts is Empty
                            </td>
                        </tr>
                    @endforelse
                </tbody>
            </table>
            <div class="m-2 p-2">
                {{ $casts->links() }}
            </div>
        </div>
    </div>

    <x-dialog-modal wire:model.live="showCastModal">
        <x-slot name="title">Edit Cast</x-slot>
        <form>
            <x-slot name="content">
                <div class="mt-10 sm:mt-0">
                    <div class="mt-5 md:mt-0 md:col-span-2">
                        <div class="sm:col-span-3">
                            <label for="cast_name" class="block text-sm font-medium leading-6 text-gray-900">Cast
                                Name</label>
                            <div class="mt-2">
                                <input wire:model="castName" type="text" id="cast_name" autocomplete="off"
                                    class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">
                            </div>
                            @error('castName')
                                <span class="text-red-600 text-sm">{{ $message }}</span>
                            @enderror
                        </div>
                        <div class="sm:col-span-3">
                            <label for="cast_poster" class="block text-sm font-medium leading-6 text-gray-900">Cast
                                Poster</label>
                            <div class="mt-2">
                                <input wire:model="castPosterPath" type="text" id="cast_poster" autocomplete="off"
                                    class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">
                            </div>
                            @error('castPosterPath')
                                <span class="text-red-600 text-sm">{{ $message }}</span>
                            @enderror
                        </div>
                    </div>
                </div>
            </x-slot>
            <x-slot name="footer">
                <x-m-button wire:click="updateCast" class="mx-2">Update</x-m-button>
                <x-secondary-button wire:click="hiddenEditModal">Cancel</x-secondary-button>
            </x-slot>
        </form>
    </x-dialog-modal>
</section>
