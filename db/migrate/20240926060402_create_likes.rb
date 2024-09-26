class CreateLikes < ActiveRecord::Migration[7.2]
  def change
    create_table :likes do |t|
      t.references :font, foreign_key: true  # フォントに対する「いいね」
      t.string :ip_address                   # IPアドレスベースで管理

      t.timestamps
    end
  end
end
