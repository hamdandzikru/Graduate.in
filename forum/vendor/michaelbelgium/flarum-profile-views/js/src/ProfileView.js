import Model from 'flarum/Model';

export default class ProfileView extends Model {
  //comes from ProfileViewSerializer (viewer(), viewedUser(), visited_at)
  visitedAt = Model.attribute('visited_at', Model.transformDate);
  viewer = Model.hasOne('viewer');
  viewedUser = Model.hasOne('viewedUser');
}