class AddColumnUrlToGist < ActiveRecord::Migration[5.2]
  def change
    add_column :gists, :url, :string
  end
end
