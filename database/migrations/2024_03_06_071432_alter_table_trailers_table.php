<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('trailers_urls', function (Blueprint $table) {
            // $table->dropColumn(['name', 'embed_html']);
            $table->string('web_name')->before('trailerable_id');
            $table->string('web_url')->before('trailerable_id');
            $table->timestamp('created_at')->after('trailerable_type');
            $table->timestamp('updated_at')->after('trailerable_type');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('trailers_urls', function (Blueprint $table) {
            $table->dropColumn(['web_name', 'web_url']);
        });
    }
};
