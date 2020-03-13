import Component from 'flarum/Component';

export default class Announce extends Component {
    init() {
        this.open = false;

        const js = app.forum.attribute('zerosonesfun-announce.js');
        if (js) {
            $('body').append(`<script>${js.trim()}</script>`);
        }
    }

    view() {
        return (
            <div id="Announce" className={this.open && 'showing'}>
                <div className="container">
                    <div className="Announce--Content Button--primary">
                        {m.trust(app.forum.attribute('zerosonesfun-announce.text') || '')}
                    </div>
                    <div className="Announce--Icons">
                        <i className={`Footer--Show fas fa-bullhorn ${this.open && 'hidden'}`} onclick={() => (this.open = true)} />
                        <i className={`Footer--Hide fa fa-times-circle ${!this.open && 'hidden'}`} onclick={() => (this.open = false)} />
                    </div>
                </div>
            </div>
        );
    }
}
