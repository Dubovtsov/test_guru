module QuestionsHelper

  def question_header(question)
    if question.new_record?
      "Create New #{question.test.title} Question"
    else
      "Edit #{question.test.title} Question"
    end
    # render inline: current_page?(new_test_question_path) ? "Create New #{test_title} Question" : "Edit #{test_title} Question"
  end
end
