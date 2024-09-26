# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Font.create([
  { name: 'Noto Serif JP', class_name: 'noto-serif-jp' },
  { name: 'Dancing Script', class_name: 'dancing-script' },
  { name: 'Cormorant Garamond', class_name: 'cormorant-garamond' },
  { name: 'Great Vibes', class_name: 'great-vibes' },
  { name: 'Patrick Hand', class_name: 'patrick-hand' },
  { name: 'Nanum Pen Script', class_name: 'nanum-pen-script' },
  { name: 'Allura', class_name: 'allura' },
  { name: 'Homemade Apple', class_name: 'homemade-apple' },
  { name: 'Shadows Into Light', class_name: 'shadows-into-light' }
])
