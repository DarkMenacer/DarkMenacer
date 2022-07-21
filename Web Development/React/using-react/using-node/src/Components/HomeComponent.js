import React from "react";
import "../Styles/Buttonstyle.css"
import CountButton from "./CountButton";
import { Link } from "react-router-dom";

const hStyle = {
    color: "Maroon",
    textAlign: "center"
}

const HomeComponent = () => {

    const placeholder = "This is a variable!";

    return (
        <div>
            <h1 style = {hStyle}>React Tutorial</h1>
                <ul style={{color: 'pink'}}>
                    <li>{placeholder}</li>
                    <li><span>First Button</span><CountButton increment={1} /*signal={red}*/ /></li>
                    <li><span>Second Button</span><CountButton increment={7} /*signal={yellow}*//></li>
                    <li>{5}</li>
                </ul>
            <Link to="/nextpage">Change Page</Link>
            
        </div>
    );
}

export default HomeComponent;