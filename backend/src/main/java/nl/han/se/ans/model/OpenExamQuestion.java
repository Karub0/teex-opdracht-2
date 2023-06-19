package nl.han.se.ans.model;

public class OpenExamQuestion extends ExamQuestion {

    public OpenExamQuestion(long id, String title, String description, boolean published) {
        super(id, title, description, QuestionType.OPEN, published);
    }

    public OpenExamQuestion(String title, String description, boolean published) {
        super(title, description, QuestionType.OPEN, published);
    }

    public OpenExamQuestion() {
    }
}
