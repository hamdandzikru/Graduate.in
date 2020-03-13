<?php

use Flarum\Database\Migration;
use Illuminate\Database\Schema\Blueprint;

 return Migration::createTable('users_profile_views', function (Blueprint $table) {
    $table->increments('id');
    $table->string("ip");
    $table->integer("user_id")->unsigned();

    $table->foreign("user_id")->references("id")->on("users")->onDelete("CASCADE")->onUpdate("CASCADE");
});
