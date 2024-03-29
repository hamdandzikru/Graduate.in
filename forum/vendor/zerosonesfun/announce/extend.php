<?php

/*
 * This file is part of zerosonesfun/announce.
 *
 * Copyright (c) 2019 Billy Wilcosky.
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace ZerosOnesFun\Announce;

use Flarum\Extend;
use Illuminate\Contracts\Events\Dispatcher;

return [
    (new Extend\Frontend('forum'))
        ->js(__DIR__.'/js/dist/forum.js')
        ->css(__DIR__.'/resources/less/forum.less'),
    (new Extend\Frontend('admin'))
        ->js(__DIR__.'/js/dist/admin.js'),
    new Extend\Locales(__DIR__.'/resources/locale'),
    function (Dispatcher $events) {
        $events->subscribe(Listeners\LoadSettingsFromDatabase::class);
    },
];
