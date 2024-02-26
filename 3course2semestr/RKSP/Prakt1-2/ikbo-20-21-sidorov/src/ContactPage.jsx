import React from 'react';
import Header from './components/Header';
import Navigation from './components/Navigation';
import Body from "./components/Body";

const ContactPage = () => {
    return (
        <div>
            <Header title="Знают Все" />
            <Navigation />
            <Body
                title="А Вы"
                text="Нет!"
            >
            </Body>
        </div>
    );
};

export default ContactPage;