class Post < ApplicationRecord
  acts_as_votable
  has_attached_file :image, styles: { medium: "200x200>", thumb: "60x60>" }, default_url: ""
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  belongs_to :user
  validates :user_id,presence: true
  validates :content,presence: true,length: {maximum: 140 } #Posts are caped to 140 characters

  default_scope -> { order(created_at: :desc)} #Newest posts first
end
