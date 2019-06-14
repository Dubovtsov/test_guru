class Answer < ApplicationRecord
  MAX_ANSWERS = 4

  belongs_to :question
  validates :body, presence: true
  validate :max_answers

  scope :right_answers, -> { where(correct: true) }

  private

  def max_answers
    amount_of_answers = question.answers.count
    errors.add(:question, "Answers can not be more than #{MAX_ANSWERS}") if amount_of_answers >= MAX_ANSWERS
  end
end
