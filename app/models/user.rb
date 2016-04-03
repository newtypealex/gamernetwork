class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_games
  has_many :games, through: :user_games

  has_many :user_platforms
  has_many :platforms, through: :user_platforms

  has_many :user_developers
  has_many :developers, through: :user_developers

  has_many :comments
  has_many :posts

  has_attached_file :photo, styles: { large: "600x600>", medium: "300x300>", thumb: "100x100>", small: "32x32>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/

end
