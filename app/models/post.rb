class Post < ApplicationRecord
  belongs_to :user
  validates :user_id,presence: true
  validates :content,presence: true,length: {maximum: 140 } #Posts are caped to 140 characters

  default_scope -> { order(created_at: :desc)} #Newest posts first
end
