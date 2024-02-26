import React from 'react';
import classes from "./Styles.module.css";
import { Link } from 'react-router-dom';



const DialogLinkItem = (props) => {
    let path = "/dialogs/" + props.id;
    return <div className={classes.dialogLinkItem}>
        <Link to={path}>{props.name}</Link>
    </div>
}

export default DialogLinkItem;