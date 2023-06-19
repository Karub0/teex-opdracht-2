import './App.css';
import React, {useEffect, useState} from "react";
import QuestionNavigation from "./components/QuestionNavigation";
import fetchQuestion from "./restGateway/restGateway";
import OpenQuestion from "./components/OpenQuestion";
import AppTopBar from "./components/AppTopBar";

function App() {
    const [question, setQuestion] = useState({id:0, title:'', description:'', type: '', options:[]});
    const [index, setIndex] = useState(1)

    useEffect(() => {
        fetchQuestion(index, setQuestion, setIndex);
    }, [index]);


    const next = async () => {
        if (index < 4) {
            fetchQuestion(index + 1, setQuestion, setIndex)
        }
    }
    const previous = async () => {
        if (index > 1) {
            fetchQuestion(index - 1, setQuestion, setIndex)
        }
    }


    return (
        <div className="App">
            <AppTopBar barTitle="ANSIE"/>
            <div className="box">
                <OpenQuestion key={question.id} question={question}/>
                <QuestionNavigation currentQuestionId={question.id} next={next} previous={previous}/>
            </div>
        </div>
    );
}

export default App;
