import React from 'react';
import { Link } from 'react-router-dom';
import classes from "./Styles.module.css";

const Navigation = () => {
    return (
        <nav>
            <ul>
                <li>
                    <Link to="/">AutoWardrobe</Link>
                </li>
                <li>
                    <Link to="/about">О нас</Link>
                </li>
                <li>
                    <Link to="/contact">Знают Все</Link>
                </li>
                <li>
                    <Link to="/dialogs">Диалоги</Link>
                </li>
            </ul>
        </nav>
    );
};

export default Navigation;