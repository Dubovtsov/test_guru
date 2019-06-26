module QuestionsHelper

  def question_header(test_title)
    if current_page?(new_test_question_path)
      render inline: "Create New #{test_title} Question"
    else
      "Edit #{test_title} Question"
    end
    # render inline: current_page?(new_test_question_path) ? "Create New #{test_title} Question" : "Edit #{test_title} Question"
  end
end
