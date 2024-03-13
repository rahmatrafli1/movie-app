<div>
    <x-button wire:click="showMovieTrailer">{{ $trailer->name }}</x-button>
    <x-dialog-modal wire:model="showMovieEmbedModal">
        <x-slot name="title">{{ $trailer->name }}</x-slot>
        <x-slot name="content">
            <div class="aspect-w-16 aspect-h-9">
                {!! $trailer->embed_html !!}
            </div>
        </x-slot>
        <x-slot name="footer">
            <button wire:click="hiddenMovieTrailerModal"
                class="inline-flex items-center px-4 py-2 bg-gray-700 border border-transparent rounded-md font-semibold text-xs text-white uppercase tracking-widest hover:bg-gray-800 focus:bg-gray-700 active:bg-gray-900 focus:outline-none focus:ring-2 focus:ring-gray-500 focus:ring-offset-2 transition ease-in-out duration-150 mr-2"
                type="button">Back</button>
        </x-slot>
    </x-dialog-modal>
</div>
