class AddForeignKeyToTests < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :tests, :users, column: :author_id
  end
end
