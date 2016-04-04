class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  has_many :post_tags
  has_many :tags, through: :post_tags

  has_attached_file :photo, styles: { large: "600x600>", medium: "300x300>", thumb: "100x100>", small: "32x32>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/

  def self.all_except(post)
    where.not(id: post)
  end


  def self.search(term)
    if term
      self.where("tag.name LIKE ?", "%#{term}%")
    else
      self.all
    end
  end

end
