class Game < ActiveRecord::Base
  has_many :user_games
  has_many :users, through: :user_games

  has_attached_file :photo, styles: { large: "600x600>", medium: "300x300>", thumb: "100x100>", small: "32x32>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
end
