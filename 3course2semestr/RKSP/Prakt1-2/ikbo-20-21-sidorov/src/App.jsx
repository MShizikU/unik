import React from 'react';
import { BrowserRouter as Router, Routes, Route, Link } from 'react-router-dom';
import HomePage from './HomePage';
import AboutPage from './AboutPage';
import ContactPage from './ContactPage';
import DialogsPage from './DialogsPage';
import DialogPage from './DialogPage';


const App = () => {
    return (
        <Router>
            <div>
                <Routes>
                    <Route path="/" element={<HomePage />} />
                    <Route path="/about" element={<AboutPage />} />
                    <Route path="/contact" element={<ContactPage />} />
                    <Route exact path="/dialogs" element={<DialogsPage />} />
                    <Route path='/dialogs/:id' element={<DialogPage/>} />
                </Routes>
            </div>
        </Router>
    );
};

export default App;