import React from 'react';
import Header from './components/Header';
import Navigation from './components/Navigation';
import Body from "./components/Body";
import Dialog from './components/DialogLinkItem';

const AboutPage = () => {
    const dialogs = [
        { id: 1, name: 'Dialog 1' },
        { id: 2, name: 'Dialog 2' },
        { id: 3, name: 'Dialog 3' },
    ];
    return (
        <div>
            <Header title="О Нас" />
            <Navigation />
            <Body
                title="AutoWardrobe"
                text="Мы производим автоматические гардеробы"
            >
            </Body>
        </div>
    );
};

export default AboutPage;