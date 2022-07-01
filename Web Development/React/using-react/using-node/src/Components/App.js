import React from "react";
import CountButton from "./CountButton";
import '../Styles/Buttonstyle.css'

const hStyle = {
    color: "Maroon",
    textAlign: "center"
}

const App = () => {
    const placeholder = "This is a variable!";
    return (
        <div>
            <h1 style = {hStyle}>React Tutorial</h1>
            <ul>
                <li>{placeholder}</li>
                <li><span>First Button</span><CountButton increment={1} /*signal={red}*/ /></li>
                <li><span>Second Button</span><CountButton increment={7} /*signal={yellow}*//></li>
            </ul>
        </div>
    );
  }

  export default App;