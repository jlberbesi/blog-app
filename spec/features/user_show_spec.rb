# spec/features/user_show_spec.rb

RSpec.describe 'UserShow', type: :feature do
  before do
    @user = User.create!(name: 'User', email: 'user@example.com')
    visit user_path(@user)
  end

  it 'shows the user details and their posts' do
    expect(page).to have_content(@user.name)
    expect(page).to have_content("Number of posts: #{@user.posts.count}")
  end

  it 'redirects to the full post list on click' do
    click_on('See all posts', match: :first)
    expect(page).to have_current_path(user_path(@user))
  end
end
