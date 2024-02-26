
import React, { StrictMode } from "react";
import * as ReactDOMClient from "react-dom/client";
import App from './App';

const app = ReactDOMClient.createRoot(document.getElementById("app"));

app.render(
  <StrictMode>
      <App></App>
  </StrictMode>
);