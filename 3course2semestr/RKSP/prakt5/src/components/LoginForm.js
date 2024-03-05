import React, { useState } from 'react';
import axios from 'axios';
import { createVerifier, createChallenge } from 'pkce';
import { useSelector, useDispatch } from 'react-redux';
import { toggleAgreement } from '../logic/actions';
import { Link } from 'react-router-dom';
import classes from "./Styles.module.css";

const LoginForm = ({ onLogin }) => {
    const [username, setUsername] = useState('');
    const [password, setPassword] = useState('');
    const agreementAccepted = useSelector(state => state.agreementAccepted);
    const dispatch = useDispatch();
    
    const handleCheckboxChange = () => {
        dispatch(toggleAgreement());
    };

    const handleSubmit = async (e) => {
        e.preventDefault();

        const codeVerifier = createVerifier();
        const codeChallenge = await createChallenge(codeVerifier);

        try {
            const response = await axios.post('http://localhost:8081', {
                username,
                password,
                code_challenge: codeChallenge,
            });
            onLogin(response.data);
        } catch (error) {
            console.error('Login failed:', error);
        }
    };

    return (
        <form className = {classes.agreement_form} onSubmit={handleSubmit}>
            <input
                className = {classes.form_field}
                type="text"
                placeholder="Username"
                value={username}
                onChange={(e) => setUsername(e.target.value)}
            />
            <input
                className = {classes.form_field}
                type="password"
                placeholder="Password"
                value={password}
                onChange={(e) => setPassword(e.target.value)}
            />
            <div className={classes.cool_checkbox_container}>
                <label className={classes.custom_checkbox}>
                    <input
                        type="checkbox"
                        checked={agreementAccepted}
                        onChange={handleCheckboxChange}
                    />
                    <div className={classes.checkbox_icon}>
                        <div className={classes.checkmark}></div>
                    </div>
                </label>
                <span className = {classes.checkbox_label}>Примите пользовательское соглашение</span>
            </div>
            <button type="submit" disabled={!agreementAccepted} className={classes.basic_btn}>
                Вход
            </button>
        </form>
    );
};

export default LoginForm;