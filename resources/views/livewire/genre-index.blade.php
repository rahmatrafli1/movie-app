<section class="container mx-auto p-6 font-mono">
    <div class="w-full flex mb-4 p-2 justify-end">
        <form class="flex space-x-4 shadow bg-white rounded-md m-2 p-2">
            <div class="p-1 flex items-center">
                <label for="genre_tmdb_id" class="block text-sm font-medium text-gray-900 mr-4">Genre TMDB
                    ID</label>
                <input wire:model="genreTMDBId" type="text" name="genre_tmdb_id" id="genre_tmdb_id" autocomplete="off"
                    class="px-3 py-2 border border-gray-300 rounded">
            </div>
            <div class="p-1">
                <button type="button" wire:click="generateGenre"
                    class="inline-flex items-center justify-center py-2 px-4 border border-transparent text-base leading-6 bg-green-600 rounded text-white">Generate
                    Genre</button>
            </div>
        </form>
    </div>
    <div class="w-full mb-8 overflow-hidden rounded-lg shadow-lg">
        <div class="w-full overflow-x-auto">
            <table class="w-full">
                <thead>
                    <tr
                        class="text-md font-semibold tracking-wide text-left text-gray-900 bg-gray-100 uppercase border-b border-gray-600">
                        <th class="px-4 py-3">Title</th>
                        <th class="px-4 py-3">Slug</th>
                        <th class="px-4 py-3">Action</th>
                    </tr>
                </thead>
                <tbody class="bg-white">
                    @forelse ($genres as $genre)
                        <tr class="text-gray-700">
                            <td class="px-4 py-3 border">
                                {{ $genre->title }}
                            </td>
                            <td class="px-4 py-3 border font-semibold">{{ $genre->slug }}</td>
                            <td class="px-4 py-3 border">
                                <x-m-button wire:click="showEditModal({{ $genre->id }})"
                                    class="bg-yellow-500 hover:bg-yellow-800">Edit</x-m-button>
                                <x-d-button wire:click="deleteGenre({{ $genre->id }})">Delete</x-d-button>
                            </td>
                        </tr>
                    @empty
                        <tr class="text-gray-700">
                            <td colspan="3" class="text-center px-4 py-3 border">
                                Data Genre is Empty
                            </td>
                        </tr>
                    @endforelse
                </tbody>
            </table>
            <div class="m-2 p-2">
                {{ $genres->links() }}
            </div>
        </div>
    </div>

    <x-dialog-modal wire:model.live="showGenreModal">
        <x-slot name="title">Edit Genre</x-slot>
        <form>
            <x-slot name="content">
                <div class="mt-10 sm:mt-0">
                    <div class="mt-5 md:mt-0 md:col-span-2">
                        <div class="sm:col-span-3">
                            <label for="title"
                                class="block text-sm font-medium leading-6 text-gray-900">Title</label>
                            <div class="mt-2">
                                <input wire:model="genreTitle" type="text" id="title" autocomplete="off"
                                    class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">
                            </div>
                            @error('genreTitle')
                                <span class="text-red-600 text-sm">{{ $message }}</span>
                            @enderror
                        </div>
                    </div>
                </div>
            </x-slot>
            <x-slot name="footer">
                <x-m-button wire:click="updateGenre" class="mx-2">Update</x-m-button>
                <x-secondary-button wire:click="hiddenEditModal">Cancel</x-secondary-button>
            </x-slot>
        </form>
    </x-dialog-modal>
</section>
