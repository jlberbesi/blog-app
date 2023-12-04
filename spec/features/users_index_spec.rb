# spec/features/users_index_spec.rb

RSpec.describe 'UsersIndex', type: :feature do
    before do
      @user1 = User.create!(name: 'User 1', email: 'user1@example.com') 
      visit users_path
    end
  
    it 'redirects to user show page on click' do
      click_on @user1.name
      expect(page).to have_current_path(user_path(@user1))
    end
  end
  