class AddCategoryRefToBadge < ActiveRecord::Migration[5.2]
  def change
    add_reference :badges, :category, foreign_key: true
    add_reference :badges, :badge_rule, foreign_key: true
  end
end
