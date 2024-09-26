class CreateFonts < ActiveRecord::Migration[7.2]
  def change
    create_table :fonts do |t|
      t.string :name
      t.string :style

      t.timestamps
    end
  end
end
