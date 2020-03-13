import User from 'flarum/models/User';
import UserPage from 'flarum/components/UserPage';
import UserCard from 'flarum/components/UserCard';
import FieldSet from 'flarum/components/FieldSet';
import icon from 'flarum/helpers/icon';
import avatar from 'flarum/helpers/avatar';
import username from 'flarum/helpers/username';
import Model from 'flarum/Model';
import ItemList from 'flarum/utils/ItemList';
import { extend } from 'flarum/extend';
import humanTime from 'flarum/utils/humanTime';
import ProfileView from '../ProfileView';

app.initializers.add('michaelbelgium-flarum-profile-views', function() {
    app.store.models.userprofileview = ProfileView;//".userprofileview" = serializer type "userprofileview"
    User.prototype.profileViews = Model.hasMany('profileViews');//comes from AddUserProfileViewsRelationship::RELATIONSHIP = php model relationship method

    extend(UserCard.prototype, 'infoItems', function(items) {
        const user = this.props.user;

        const count = user.profileViews() === false ? 0 : user.profileViews().length;

        items.add('profile-views',(
            <span>
                {icon('far fa-eye')}
                {' '}
                {app.translator.transChoice('flarum_profile_views.forum.user.views_count_text', count, {viewcount: '' + count})}
            </span>
        ));
    });

    extend(UserPage.prototype, 'sidebarItems', function(items) {
        const lastViewed = new ItemList();

        var views = this.user.profileViews();

        if(views !== false)
        {
            if(views.length >= 5) {
                views = views.slice(0, 5);
            }
    
            views.forEach(pv => {
                lastViewed.add('lastUser-' + pv.viewer().id(),
                    <a href={app.forum.attribute('baseUrl') + '/u/' + pv.viewer().username() }>
                        {avatar(pv.viewer(), {className: 'lastUser-avatar'})}
                        <div>
                            {username(pv.viewer())}
                            <span className="lastUser-visited" title={pv.visitedAt().toLocaleString()}>{humanTime(pv.visitedAt())}</span>
                        </div>
                    </a>
                );
            });
        }

        items.add('lastViewedUsers', FieldSet.component({
            label: app.translator.trans('flarum_profile_views.forum.user.title_last_viewers'),
            className: 'LastUsers',
            children: lastViewed.toArray()
        }));
    });

    extend(UserPage.prototype, 'show', function() {
        if(typeof app.session.user !== 'undefined' && app.session.user.id() !== this.user.id())
        {
            app.request({
                method: 'POST',
                url: app.forum.attribute('apiUrl') + '/profileview',
                data: { 
                    viewer: app.session.user.id(),
                    viewedUser: this.user.id()
                }
            });
        }
    });
});
