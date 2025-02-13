import { createContext, useEffect, useState } from "react";
import fetchQuestion from "./restGateway/RestGateway";

export const DataContext = createContext();

export function DataProvider({ children }) {
  const [question, setQuestion] = useState({
    id: 0,
    title: "",
    description: "",
    type: "",
    options: [],
  });
  const [index, setIndex] = useState(1);

  useEffect(() => {
    fetchQuestion(index, setQuestion, setIndex);
  }, [index]);

  const next = () => setIndex((prev) => prev + 1);
  const previous = () => setIndex((prev) => prev - 1);

  return (
    <DataContext.Provider value={{ question, next, previous }}>
      {children}
    </DataContext.Provider>
  );
}
