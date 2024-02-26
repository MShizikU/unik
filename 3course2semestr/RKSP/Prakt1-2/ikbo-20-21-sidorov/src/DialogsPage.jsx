import React from 'react';
import Header from './components/Header';
import Navigation from './components/Navigation';
import Body from "./components/Body";
import DialogLinkItem from './components/DialogLinkItem';

const DialogsPage = () => {
    const dialogs = [
        { id: 1, name: 'Dialog 1' },
        { id: 2, name: 'Dialog 2' },
        { id: 3, name: 'Dialog 3' },
    ];
    return (
        <div>
            <Header title="Диалоги" />
            <Navigation />
            <Body
                title="AutoWardrobe"
                text="А у нас еще и диалоги есть"
            >
            </Body>

            <div>
                {dialogs.map(dialog => (
                    <DialogLinkItem key={dialog.id} id={dialog.id} name={dialog.name} />
                ))}
            </div>
        </div>
    );
};

export default DialogsPage;