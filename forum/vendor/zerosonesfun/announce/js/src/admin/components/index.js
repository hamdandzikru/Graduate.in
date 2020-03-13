import app from 'flarum/app';
import AnnounceSettingsModal from './components/AnnounceSettingsModal';

app.initializers.add('zerosonesfun-announce', () => {
    app.extensionSettings['zerosonesfun-announce'] = () => app.modal.show(new AnnounceSettingsModal());
});
