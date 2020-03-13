<?php

use Flarum\Database\Migration;

return Migration::addColumns("user_profile_views", [
    "visited_at" => ["datetime"]
]);