class Answer < ApplicationRecord
  belongs_to :question
  validates :body, presence: true
  validate :max_answers

  scope :right_answers, -> { where(correct: true) }

  private

  def max_answers
    amount_of_answers = Answer.where(question_id: self.question_id).count
    errors.add(:question) if amount_of_answers >= 4
  end
end
