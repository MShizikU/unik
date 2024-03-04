import React from 'react';
import { useSelector, useDispatch } from 'react-redux';
import { toggleAgreement } from '../logic/actions';
import classes from "./Styles.module.css";

const UserAgreementForm = () => {
    const agreementAccepted = useSelector(state => state.agreementAccepted);
    const dispatch = useDispatch();

    const handleCheckboxChange = () => {
        dispatch(toggleAgreement());
    };

    const handleSubmit = (e) => {
        e.preventDefault();
    };

    return (
        <form className={classes.agreement_form} onSubmit={handleSubmit}>
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
                Подтвердить соглашение
            </button>
        </form>
    );
};

export default UserAgreementForm;