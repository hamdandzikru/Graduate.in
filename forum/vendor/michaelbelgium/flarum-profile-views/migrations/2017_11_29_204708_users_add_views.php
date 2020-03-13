<?php

use Flarum\Database\Migration;

return Migration::addColumns("users", [
    "views" => ["integer", "default" => 0]
]);