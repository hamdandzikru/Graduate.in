<?php

namespace Michaelbelgium\Profileviews\Models;

use Flarum\Database\AbstractModel;
use Flarum\User\User;

class UserProfileView extends AbstractModel
{
	protected $table = 'user_profile_views';
	protected $dates = ['visited_at'];

	public function viewedUser()
	{
		return $this->belongsTo(User::class, 'viewed_user_id');
	}

	public function viewer()
	{
		return $this->belongsTo(User::class, 'viewer_id');
	}
}
