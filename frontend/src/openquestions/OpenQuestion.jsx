import { useContext } from "react";
import { DataContext } from "../DataContext";
import Question from "./Question";
import { TextField } from "@mui/material";

export default function OpenQuestion() {
  const { question } = useContext(DataContext);

  return (
    <>
      <h4>Open vraag</h4>
      <Question
        question={question}
        answerInput={
          <TextField
            fullWidth
            label={question.description}
            id={question.id}
            name={question.description}
          />
        }
      />
    </>
  );
}
