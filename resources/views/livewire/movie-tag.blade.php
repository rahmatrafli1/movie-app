<div>
    <div class="flex flex-wrap space-x-2 m-2">
        @forelse ($movie->tags as $mtag)
            <x-button wire:click="detachTag({{ $mtag->id }})"
                class="hover:bg-red-500">{{ $mtag->tag_name }}</x-button>
        @empty
            No Tag
        @endforelse
    </div>

    <input wire:model.live="queryTag" type="text" class="rounded w-full" placeholder="Search Tag">

    @if (!empty($queryTag))
        <div class="w-full">
            @if (!empty($tags))
                @foreach ($tags as $tag)
                    <div wire:click="addTag({{ $tag->id }})"
                        class="w-full p-2 m-2 bg-green-300 hover:bg-green-500 cursor-pointer">
                        {{ $tag->tag_name }}
                    </div>
                @endforeach
            @endif
        </div>
    @endif
</div>
