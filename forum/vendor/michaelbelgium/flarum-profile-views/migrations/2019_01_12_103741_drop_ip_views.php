<?php

use Flarum\Database\Migration;

return Migration::dropColumns("user_profile_views", [
    "ip" => ["string"]
]);