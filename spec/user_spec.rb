require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is not valid without a name' do
    user = User.new(name: nil)
    expect(user).to_not be_valid
  end

  it 'is not valid with a negative posts_counter' do
    user = User.new(posts_counter: -1)
    expect(user).to_not be_valid
  end

  describe '#three_most_recent_posts' do
    it 'returns the three most recent posts' do
      user = User.create!(name: 'Test User', posts_counter: 0)
      Post.create!(title: 'Old Post', author: user, comments_counter: 0, likes_counter: 0,
                   created_at: 5.days.ago)
      recent_posts = 3.times.map do |i|
        Post.create!(title: "Post #{i}", author: user, comments_counter: 0, likes_counter: 0, created_at: i.days.ago)
      end

      expect(user.three_most_recent_posts).to match_array(recent_posts)
    end
  end
end
