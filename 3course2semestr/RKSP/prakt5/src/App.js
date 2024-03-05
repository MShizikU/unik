import React, { useState } from 'react';
import { BrowserRouter as Router, Route, Switch, Redirect, useHistory  } from 'react-router-dom';
import { Provider } from 'react-redux';
import { createStore } from 'redux';
import reducer from './logic/reducer';
import PrivateRoute from './components/PrivateRoute';
import LoginForm from './components/LoginForm';
import Dashboard from './components/DashBoard';

const store = createStore(reducer);

const App = () => {
  const [isLoggedIn, setIsLoggedIn] = useState(false);
  const history = useHistory();

  const handleLogin = (userData) => {
      setIsLoggedIn(true);
      console.log('isLoggedIn:', isLoggedIn);
  };

  const handleLogout = () => {
      setIsLoggedIn(false);
  };

  return (
    <Provider store={store}> {}
      <Router>
        <Switch>
          <Route path="/login">
            <LoginForm onLogin={handleLogin} />
          </Route>
          <PrivateRoute path="/dashboard" component={Dashboard} isLoggedIn={isLoggedIn} />
          <Route path="/">
              <Redirect to="/login" />
          </Route>
        </Switch>
      </Router>
    </Provider>
  );
}

export default App;
