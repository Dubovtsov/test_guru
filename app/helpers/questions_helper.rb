module QuestionsHelper
  def question_header(test_title)
    render inline: "Create New #{test_title} Question" if action = :new || "Edit #{test_title} Question"
  end
end
