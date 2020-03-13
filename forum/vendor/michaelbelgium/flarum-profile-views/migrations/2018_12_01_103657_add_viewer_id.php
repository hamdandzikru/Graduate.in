<?php

use Illuminate\Database\Schema\Builder;
use Illuminate\Database\Schema\Blueprint;

return [
    'up' => function (Builder $schema) {
        $schema->table('user_profile_views', function (Blueprint $table) {
            $table->integer("viewer_id")->unsigned()->nullable();

            $table->foreign("viewer_id")->references("id")->on("users")->onDelete("CASCADE")->onUpdate("CASCADE");
        });
    },

    'down' => function (Builder $schema) {
        $schema->table('user_profile_views', function (Blueprint $table) {
            $table->dropForeign(['viewer_id']);
            $table->dropColumn('viewer_id');
        });        
    }
];
