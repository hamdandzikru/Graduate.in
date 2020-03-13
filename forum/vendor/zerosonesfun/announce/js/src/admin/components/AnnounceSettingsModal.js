import SettingsModal from 'flarum/components/SettingsModal';

export default class AnnounceSettingsModal extends SettingsModal {
    className() {
        return 'AnnounceSettingsModal Modal--medium';
    }

    title() {
        return app.translator.trans('zerosonesfun-announce.admin.settings.title');
    }

    form() {
        return [
            <div className="Form-group">
                <label>{app.translator.trans('zerosonesfun-announce.admin.settings.text')}</label>
                <textarea rows="5" required className="FormControl" type="text" bidi={this.setting('zerosonesfun-announce.text')} />
            </div>,
        ];
    }
}
