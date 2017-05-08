class User < ApplicationRecord
  acts_as_voter
  rolify :before_add => :before_add_method
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/avatar.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  def before_add_method(role)
    # do something before it gets added
  end

  after_create :assign_default_role

  def assign_default_role
    self.add_role(:newuser) if self.roles.blank?
  end
  

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts, dependent: :destroy #Remove the users posts if user is deleted
  has_many :active_relationships, class_name: "Relationship",foreign_key: "follower_id", dependent: :destroy #Si uno de lo dos usuarios boorado relacion borrada
  has_many :passive_relationships, class_name: "Relationship",foreign_key: "followed_id", dependent: :destroy #Si uno de lo dos usuarios boorado relacion borrada

  has_many :following,through: :active_relationships, source: :followed
  has_many :followers,through: :passive_relationships, source: :follower



  #Helper methods, You can follow everybody but you cant force that anybody follows you

  #Follow another user

  def follow(other)
    active_relationships.create(followed_id: other.id)
  end

  def unfollow(other)
    active_relationships.find_by(followed_id: other.id).destroy
  end
  #Is following a user?
  def following?(other)
    following.include?(other)

  end
  # def show
  #     @post = Post.find params[:id]
  # end
end
