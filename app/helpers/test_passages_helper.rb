module TestPassagesHelper

  def success_rate
    self.correct_questions
    test.questions.correct_answers.count
  end

end

