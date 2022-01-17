class Micropost < ApplicationRecord
  belongs_to :user
  
  validates :content, presence: true, length: { maximum: 255 }

  #お気に入り  
  has_many :reverses_of_favorite, class_name: 'Favorite', foreign_key: 'micropost_id'
  has_many :liked, through: :reverses_of_favorite, source: :user
  
  #お気に入りに入ってても削除可能
  has_many :favorites, dependent: :destroy
end
