import { useContext } from "react";
import { DataContext } from "../DataContext";
import NavigationButton from "./NavigationButton";

export default function Navigator() {
  const { question, next, previous } = useContext(DataContext);

  if (question.id === 1) {
    return (
      <div className="navigation">
        <NavigationButton action={next} title="Volgende" />
      </div>
    );
  }
  if (question.id >= 2 && question.id < 4) {
    return (
      <div className="navigation">
        <NavigationButton action={previous} title="Vorige" />
        <NavigationButton action={next} title="Volgende" />
      </div>
    );
  }
  if (question.id === 4) {
    return (
      <div className="navigation">
        <NavigationButton action={previous} title="Vorige" />
      </div>
    );
  }
}
