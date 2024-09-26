class Font < ApplicationRecord
  has_many :likes, dependent: :destroy

  def likes_count
    likes.count
  end
end
