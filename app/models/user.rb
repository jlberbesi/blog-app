class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :posts, foreign_key: 'author_id', dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  before_validation :set_default_posts_counter

  def three_most_recent_posts
    posts.order(created_at: :desc).limit(3)
  end

  def admin?
    role == 'admin'
  end

  private

  def set_default_posts_counter
    self.posts_counter ||= 0
  end
end
