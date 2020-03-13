<?php

namespace Michaelbelgium\Profileviews\Serializers;

use Flarum\Api\Serializer\AbstractSerializer;
use Flarum\Api\Serializer\UserSerializer;

class UserProfileViewSerializer extends AbstractSerializer
{
	protected $type = 'userprofileview';

    protected function getDefaultAttributes($profileview)
    {
        return [
            'visited_at' => $this->formatDate($profileview->visited_at)
        ];
    }
	
    protected function viewedUser($profileview)
    {
        return $this->hasOne($profileview, UserSerializer::class);
    }
	
    protected function viewer($profileview)
    {
        return $this->hasOne($profileview, UserSerializer::class);   
    }
}