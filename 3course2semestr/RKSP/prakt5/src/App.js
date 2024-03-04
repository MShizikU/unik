import React from 'react';
import { Provider } from 'react-redux';
import { createStore } from 'redux';
import reducer from './logic/reducer';
import UserAgreementForm from './components/UserAgreementForm';

const store = createStore(reducer);

function App() {
  return (
    <Provider store={store}>
        <div className="App">
          <UserAgreementForm />
        </div>
    </Provider>
  );
}

export default App;
