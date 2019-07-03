class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_update :before_update_next_question

  MIN_PERCENT = 85

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end
    save!
  end

  def completed?
    current_question.nil?
  end

  def success_rate
    questions = self.test.questions
    test_correct_answers = 0

    questions.each do |q|
      test_correct_answers += q.answers.correct.count
    end
    rate = self.correct_questions * 100 / test_correct_answers
  end

  def successfully?
    self.success_rate >= MIN_PERCENT
  end

  def question_number
    test.questions.order(:id).where('questions.id <= ?', current_question.id).count
  end

  private

  def before_update_next_question
    self.current_question = next_question
  end

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def correct_answer?(answer_ids)
    correct_answers_count = correct_answers.count
    (correct_answers_count == correct_answers.where(id: answer_ids).count) &&
    correct_answers_count == answer_ids.count
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end

end
