
import React, { StrictMode } from "react";
import * as ReactDOMClient from "react-dom/client";
import Header from "./components/Header";
import Body from "./components/Body";

const app = ReactDOMClient.createRoot(document.getElementById("app"));

app.render(
  <StrictMode>
    <Header header="Автоматизированный гардероб" />
    <Body
      title="Гардероб"
      text="Автоматизированный"
    />
  </StrictMode>
);