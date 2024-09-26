class Like < ApplicationRecord
  belongs_to :font

  validates :ip_address, uniqueness: { scope: :font_id } # 同じIPで同じフォントに対する重複いいねを防ぐ
end
