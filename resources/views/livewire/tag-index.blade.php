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
                        <th class="px-4 py-3">Tag Name</th>
                        <th class="px-4 py-3">Slug</th>
                        <th class="px-4 py-3">Action</th>
                    </tr>
                </thead>
                <tbody class="bg-white">
                    @forelse($tags as $tag)
                        <tr class="text-gray-700">
                            <td class="px-4 py-3 border">
                                {{ $tag->tag_name }}
                            </td>
                            <td class="px-4 py-3 border font-semibold">
                                {{ $tag->slug }}
                            </td>
                            <td class="px-4 py-3 border">
                                <x-m-button class="bg-yellow-500 hover:bg-yellow-800"
                                    wire:click="showEditModal({{ $tag->id }})">Edit</x-m-button>
                                <x-d-button wire:click="deleteTag({{ $tag->id }})">Delete</x-d-button>
                            </td>
                        </tr>
                    @empty
                        <tr class="text-gray-700">
                            <td colspan="4" class="text-center px-4 py-3 border">
                                Data Tags is Empty
                            </td>
                        </tr>
                    @endforelse
                </tbody>
            </table>
        </div>
    </div>

    <x-dialog-modal wire:model.live="showTagModal">
        @if ($tagId)
            <x-slot name="title">Edit Tag</x-slot>
        @else
            <x-slot name="title">Create Tag</x-slot>
        @endif
        <form>
            <x-slot name="content">
                <div class="mt-10 sm:mt-0">
                    <div class="mt-5 md:mt-0 md:col-span-2">
                        <div class="sm:col-span-3">
                            <label for="tag_name" class="block text-sm font-medium leading-6 text-gray-900">Tag
                                Name</label>
                            <div class="mt-2">
                                <input wire:model="tagName" type="text" id="tag_name" autocomplete="off"
                                    class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">
                            </div>
                        </div>
                    </div>
                </div>
            </x-slot>
            <x-slot name="footer">
                @if ($tagId)
                    <x-m-button wire:click="updateTag" class="mx-2">Update</x-m-button>
                @else
                    <x-m-button wire:click="createTag" class="mx-2">Create</x-m-button>
                @endif
                <x-secondary-button wire:click="hiddenCreateModal">Cancel</x-secondary-button>
            </x-slot>
        </form>
    </x-dialog-modal>
</section>
