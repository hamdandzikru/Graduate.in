<?php
namespace Michaelbelgium\Profileviews\Listeners;

use Illuminate\Contracts\Events\Dispatcher;
use Flarum\Event\GetApiRelationship;
use Flarum\Event\GetModelRelationship;
use Flarum\User\User;
use Flarum\Api\Event\WillGetData;
use Flarum\Api\Serializer\UserSerializer;
use Flarum\Api\Controller\ShowUserController;
use Michaelbelgium\Profileviews\Models\UserProfileView;
use Michaelbelgium\Profileviews\Serializers\UserProfileViewSerializer;

class AddUserProfileViewsRelationship
{
	const RELATIONSHIP = "profileViews"; //$user->profileViews()
	const RELATIONSHIP_OTHER = "viewedProfiles"; //$user->viewedProfiles()

    /**
     * @param Dispatcher $events
     */
    public function subscribe(Dispatcher $events)
    {
		$events->listen(WillGetData::class, [$this, 'includeTagsRelationship']);
		$events->listen(GetModelRelationship::class, [$this, 'getModelRelationship']);
		$events->listen(GetApiRelationship::class, [$this, 'getApiRelationship']);
	}
	
	public function getModelRelationship(GetModelRelationship $event)
	{
		if($event->isRelationship(User::class, self::RELATIONSHIP))
		{
			return $event->model->hasMany(UserProfileView::class, 'viewed_user_id');
		}

		if($event->isRelationship(User::class, self::RELATIONSHIP_OTHER))
		{
			return $event->model->hasMany(UserProfileView::class, 'viewer_id');
		}
	}

	/**
	 * @param GetApiRelationship $event
	 * @return \Tobscure\JsonApi\Relationship|null
	 */
	public function getApiRelationship(GetApiRelationship $event)
	{
		if ($event->isRelationship(UserSerializer::class, self::RELATIONSHIP)) {
			return $event->serializer->hasMany($event->model, UserProfileViewSerializer::class, self::RELATIONSHIP);
		}

		//todo test:
		if ($event->isRelationship(UserSerializer::class, self::RELATIONSHIP_OTHER)) {
			return $event->serializer->hasMany($event->model, UserProfileViewSerializer::class, self::RELATIONSHIP_OTHER);
		}
	}

	/**
     * @param WillGetData $event
     */
	public function includeTagsRelationship(WillGetData $event)
	{
		if($event->controller->serializer == UserSerializer::class)
			$event->addInclude([self::RELATIONSHIP, self::RELATIONSHIP.'.viewer', self::RELATIONSHIP.'.viewedUser']);//".x" comes from model relationship UserProfileView
	}
}