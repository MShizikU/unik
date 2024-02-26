import React from 'react';
import classes from "./Styles.module.css";


const Header = (props) => {
    return (
        <header>
            <h1>{props.title}</h1>
        </header>
    );
};

export default Header;