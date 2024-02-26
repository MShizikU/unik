import React from 'react';
import classes from "./Styles.module.css";


const Dialog = ({ id, name }) => {
    return (
        <div>
            <h3>Dialog: {name}</h3>
            <p>ID: {id}</p>
        </div>
    );
};

export default Dialog;