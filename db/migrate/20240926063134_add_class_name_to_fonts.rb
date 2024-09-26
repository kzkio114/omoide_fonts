class AddClassNameToFonts < ActiveRecord::Migration[7.2]
  def change
    add_column :fonts, :class_name, :string
  end
end
