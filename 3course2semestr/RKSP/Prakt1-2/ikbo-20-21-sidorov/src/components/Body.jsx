import React from "react";
import classes from "./Styles.module.css";

function Body(props) {
  return (
    <div className={classes.main}>
      <h1 className={classes.title}>{props.title}</h1>
      <h3 className={classes.article}>{props.text}</h3>
    </div>
  );
}
export default Body;

