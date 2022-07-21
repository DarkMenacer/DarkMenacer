import React from "react";
import HomeComponent from "./HomeComponent";
import NewPage from "./NewPage";
import { BrowserRouter, Routes, Route } from "react-router-dom";

const App = () => {
    
    return (
        <BrowserRouter>
            <Routes>
                <Route path='/' element={<HomeComponent/>} />
                <Route path='/nextpage' element={<NewPage/>} />

            </Routes>
        </BrowserRouter>
    );
  }

  export default App;