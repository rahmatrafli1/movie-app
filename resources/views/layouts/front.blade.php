<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ config('app.name', 'Laravel') }}</title>

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.bunny.net">
    <link href="https://fonts.bunny.net/css?family=figtree:400,500,600&display=swap" rel="stylesheet" />

    <!-- Scripts -->
    @vite(['resources/css/front.css', 'resources/js/front.js'])

    <!-- Styles -->
    @livewireStyles
</head>

<body class="bg-gray-200 dark:bg-gray-700">
    <x-navbar />
    {{ $slot }}
    <x-footer />
    @stack('modals')

    @livewireScripts
</body>

</html>
