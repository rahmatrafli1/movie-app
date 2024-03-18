<div class="relative pointer-events-auto">
    <button type="button" wire:click="showSearch"
        class="w-52 md:w-72 flex dark:bg-gray-700 items-center text-sm leading-6 text-slate-400 rounded-md ring-1 ring-slate-900/10 shadow-sm py-1.5 pl-2 pr-3 hover:ring-slate-300 dark:highlight-white/5 dark:hover:bg-slate-900"><svg
            width="24" height="24" fill="none" aria-hidden="true" class="mr-3 flex-none">
            <path d="m19 19-3.5-3.5" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                stroke-linejoin="round">
            </path>
            <circle cx="11" cy="11" r="6" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                stroke-linejoin="round"></circle>
        </svg>Search<span class="ml-auto pl-3 flex-none text-xs font-semibold">
    </button>

    <x-dialog-modal-dark wire:model="showSearchModal">
        <x-slot name="title">Search</x-slot>
        <x-slot name="content">
            <div class="flex flex-col">
                <input wire:model.live="search" type="text" class="rounded w-full dark:bg-gray-700" id="searchMovie"
                    autocomplete="off">

                <div wire:loading class="border border-blue-300 shadow rounded-md p-4 mt-2 w-full mx-auto">
                    <div class="animate-pulse flex space-x-4">
                        <div class="rounded-full bg-slate-700 h-10 w-10"></div>
                        <div class="flex-1 space-y-6 py-1">
                            <div class="h-2 bg-slate-700 rounded"></div>
                            <div class="space-y-3">
                                <div class="grid grid-cols-3 gap-4">
                                    <div class="h-2 bg-slate-700 rounded col-span-2"></div>
                                    <div class="h-2 bg-slate-700 rounded col-span-1"></div>
                                </div>
                                <div class="h-2 bg-slate-700 rounded"></div>
                            </div>
                        </div>
                    </div>
                </div>

                @if (!empty($search))
                    <div class="w-full" wire:loading.remove>
                        @if (!empty($searchResults))
                            @foreach ($searchResults as $searchResult)
                                <h1 class="text-white font-bold">{{ $searchResult['type'] }}</h1>

                                <a href="{{ $searchResult['url'] }}">
                                    <div
                                        class="p-2 m-2 bg-gray-700 hover:bg-gray-500 dark:bg-white dark:hover:bg-gray-100 dark:text-gray-900 rounded text-white cursor-pointer">
                                        {{ $searchResult['title'] }}
                                    </div>
                                </a>
                            @endforeach
                        @endif
                    </div>
                @endif
            </div>
        </x-slot>
        <x-slot name="footer">
            <button wire:click="hiddenSearchModal"
                class="inline-flex items-center px-4 py-2 bg-gray-700 dark:bg-white border border-transparent rounded-md font-semibold text-xs text-white dark:text-gray-800 uppercase tracking-widest hover:bg-gray-800 dark:hover:bg-gray-200 active:bg-gray-900 hover:outline-none hover:ring-2 hover:ring-gray-500 dark:hover:ring-gray-200 hover:ring-offset-2 transition ease-in-out duration-150 mr-2"
                type="button">Back</button>
        </x-slot>
    </x-dialog-modal-dark>
</div>
