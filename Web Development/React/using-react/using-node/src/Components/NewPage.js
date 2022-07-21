import React from "react";
import { useNavigate } from "react-router-dom";

const NewPage = () => {

    const navigate = useNavigate();
    const handleClick = () =>{
        navigate('/');
    }


    return (
        <div>
            This is a new page altogether
            <div>
            <button onClick={handleClick}>Go Back</button>
            </div>
            
        </div>
    );
}

export default NewPage