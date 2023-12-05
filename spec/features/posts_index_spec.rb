require 'rails_helper'

RSpec.describe 'UserPostsIndex', type: :feature do
  before do
    @user = User.create!(name: 'User', email: 'user@example.com')

    5.times { |i| @user.posts.create!(title: "Post #{i + 1}", text: "This is post #{i + 1}") }
  end

  it 'shows posts of a user' do
    visit user_posts_path(@user)
    @user.posts.each do |post|
      expect(page).to have_content(post.title)
      expect(page).to have_content(post.text[0..20])
    end
  end

  it 'redirects to the post show page on click' do
    visit user_posts_path(@user)
    click_on @user.posts.first.title
    expect(current_path).to eq(post_path(@user.posts.first))
  end
end
