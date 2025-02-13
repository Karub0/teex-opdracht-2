import "./App.css";
import React from "react";
import { DataProvider } from "./DataContext";
import AppTopBar from "./openquestions/AppTopBar";
import OpenQuestion from "./openquestions/OpenQuestion";
import Navigator from "./openquestions/Navigator";

function App() {
  return (
    <DataProvider>
      <div className="App">
        <AppTopBar barTitle="ANSIE" />
        <div className="box">
          <OpenQuestion />
          <Navigator />
        </div>
      </div>
    </DataProvider>
  );
}

export default App;
