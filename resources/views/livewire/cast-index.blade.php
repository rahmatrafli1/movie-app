<section class="container mx-auto p-6 font-mono">
    <div class="w-full flex mb-4 p-2 justify-end">
        <form>
            <div class="shadow overflow-hidden sm:rounded-md bg-white">
                <div class="mt-5 md:mt-0 md:col-span-2 px-4 py-5">
                    <div class="sm:col-span-3">
                        <label for="cast_tmdb_id" class="block text-sm font-medium leading-6 text-gray-900">Cast TMDB
                            ID</label>
                        <div class="mt-2">
                            <input wire:model="castTMDBId" type="text" id="cast_tmdb_id" autocomplete="off"
                                class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">
                        </div>
                    </div>
                </div>
                <div class="px-4 py-1">
                    <x-button wire:click="generateCast">Generate Cast</x-button>
                </div>
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
                                {{ $cast->poster_path }}
                            </td>
                            <td class="px-4 py-3 border">Edit</td>
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

            {{ $casts->links() }}
        </div>
    </div>
</section>
