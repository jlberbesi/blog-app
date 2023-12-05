# spec/features/post_show_spec.rb
require 'rails_helper'

RSpec.describe 'PostShow', type: :feature do
  before do
    @user = User.create!(name: 'User', email: 'user@example.com')
    @post = @user.posts.create!(title: 'Sample Post', text: 'This is a sample post')
  end

  it 'shows details of a post' do
    visit post_path(@post)
    expect(page).to have_content(@post.title)
    expect(page).to have_content(@post.text)
    expect(page).to have_content('Comments: ')
    expect(page).to have_content('Likes: ')
  end
end
