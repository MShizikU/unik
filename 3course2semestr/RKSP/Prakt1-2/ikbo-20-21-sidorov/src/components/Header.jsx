import React from "react";
import classes from "./Styles.module.css";

function Header(props) {
  return (
    <header className={classes.headers}>
        {props.header.toUpperCase()}
    </header>
  );
}

export default Header;