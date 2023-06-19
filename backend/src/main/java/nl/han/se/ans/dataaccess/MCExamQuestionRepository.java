package nl.han.se.ans.dataaccess;

import nl.han.se.ans.model.MCExamQuestion;
import nl.han.se.ans.model.OpenExamQuestion;

import java.util.List;

public interface MCExamQuestionRepository {
    List<MCExamQuestion> findAll();

    MCExamQuestion findById(long id);
}
