package nl.han.se.ans.model;

import java.util.ArrayList;
import java.util.List;

public class MCExamQuestion extends ExamQuestion {
    private List<MCExamOption> options = new ArrayList<>();

    public MCExamQuestion(long id, String title, String description, boolean published) {
        super(id, title, description, QuestionType.MC, published);
    }

    public MCExamQuestion() {
    }

    public List<MCExamOption> getOptions() {
        return options;
    }

    public void setOptions(List<MCExamOption> options) {
        this.options = options;
    }
}
