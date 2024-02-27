<section class="container mx-auto p-6 font-mono">
    <div class="w-full flex mb-4 p-2 justify-end">
        <x-button wire:click="showCreateModal">Create Tag</x-button>
    </div>
    <div class="w-full mb-8 overflow-hidden rounded-lg shadow-lg">
        <div class="w-full overflow-x-auto">
            <table class="w-full">
                <thead>
                    <tr
                        class="text-md font-semibold tracking-wide text-left text-gray-900 bg-gray-100 uppercase border-b border-gray-600">
                        <th class="px-4 py-3">Title</th>
                        <th class="px-4 py-3">Release Date</th>
                        <th class="px-4 py-3">Rating</th>
                        <th class="px-4 py-3">Public</th>
                        <th class="px-4 py-3">Manage</th>
                    </tr>
                </thead>
                <tbody class="bg-white">
                    <tr class="text-gray-700">
                        <td class="px-4 py-3 border">
                            Title Here
                        </td>
                        <td class="px-4 py-3 border">Date</td>
                        <td class="px-4 py-3 border">
                            5
                        </td>
                        <td class="px-4 py-3 border">Yes</td>
                        <td class="px-4 py-3 border">Edit</td>
                </tbody>
            </table>
        </div>
    </div>

    <x-dialog-modal wire:model.live="showTagModal">
        <x-slot name="title">Create Tag</x-slot>
        <form>
            <x-slot name="content">
                <div class="mt-10 sm:mt-0">
                    <div class="mt-5 md:mt-0 md:col-span-2">
                        <div class="sm:col-span-3">
                            <label for="tag_name" class="block text-sm font-medium leading-6 text-gray-900">Tag
                                Name</label>
                            <div class="mt-2">
                                <input wire:model="tagName" type="text" autocomplete="off"
                                    class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">
                            </div>
                        </div>
                    </div>
                </div>
            </x-slot>
            <x-slot name="footer">
                <button wire:click="createTag"
                    class="inline-flex items-center px-4 py-2 bg-indigo-700 border border-transparent rounded-md font-semibold text-xs text-white uppercase tracking-widest hover:bg-indigo-800 focus:bg-indigo-700 active:bg-indigo-900 focus:outline-none focus:ring-2 focus:ring-gray-500 focus:ring-offset-2 transition ease-in-out duration-150 mx-2">Create</button>
                <x-secondary-button wire:click="hiddenCreateModal">Cancel</x-secondary-button>
            </x-slot>
        </form>
    </x-dialog-modal>
</section>
