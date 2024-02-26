import React from 'react';
import Header from './components/Header';
import Navigation from './components/Navigation';
import Body from './components/Body';

const HomePage = () => {
    return (
        <div>
            <Header title="AutoWardrobe" />
            <Navigation />
            <Body
                title="Добро пожаловать!"
                text="Это сайт компании AutoWardrobe"
            >
            </Body>
        </div>
    );
};

export default HomePage;