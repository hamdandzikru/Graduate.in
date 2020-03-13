<?php

namespace Michaelbelgium\Profileviews\Controllers;

use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Psr\Http\Server\RequestHandlerInterface;
use Zend\Diactoros\Response\JsonResponse;
use Flarum\User\User;
use Carbon\Carbon;
use Michaelbelgium\Profileviews\Models\UserProfileView;

class CreateUserProfileViewController implements RequestHandlerInterface
{
    public function handle(Request $request): Response
    {
        $viewedUserId = array_get($request->getParsedBody(), 'viewedUser');
        $viewerId = array_get($request->getParsedBody(), 'viewer');
        $viewedUser = User::find($viewedUserId);

        $profileView = $viewedUser->profileViews()->where('viewer_id', $viewerId)->first();

        if(is_null($profileView)) {
            $profileView = new UserProfileView();
            $profileView->viewedUser()->associate($viewedUser);
            $profileView->viewer()->associate(User::find($viewerId));
        }

        $profileView->visited_at = Carbon::now();
        $profileView->save();
        
        return new JsonResponse($profileView->toArray());
    }
}