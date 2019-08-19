class AddCurrentQuestionToTestPassage < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :test_passages, :questions, column: :current_question
  end
end
