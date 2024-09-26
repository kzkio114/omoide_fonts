class AddSessionIdToLikes < ActiveRecord::Migration[7.2]
  def change
    add_column :likes, :session_id, :string
  end
end
