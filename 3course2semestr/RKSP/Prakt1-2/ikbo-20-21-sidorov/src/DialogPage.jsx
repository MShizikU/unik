import React from 'react';
import Header from './components/Header';
import Navigation from './components/Navigation';
import Body from "./components/Body";
import { Link, useParams } from "react-router-dom";

const DialogPage = () => {
    
    const {id} = useParams();
    const texxt = "Имеет такой номер: " + id;
    return (
        <div>
            <Header title="Contact" />
            <Navigation />
            <Body
                title="А Диалог "
                text = {texxt}
            >
            </Body>
        </div>
    );
};

export default DialogPage;