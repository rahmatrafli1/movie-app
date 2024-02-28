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
