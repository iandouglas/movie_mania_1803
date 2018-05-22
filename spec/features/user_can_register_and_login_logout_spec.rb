# As a visitor
# when I submit a registration form
# then I have an account created

require 'rails_helper'

describe 'Visitor' do
  context 'logs in' do
    it 'should log in the user' do
      username = 'octocat'
      password = 'password'
      user = User.create!(username: username, password: password)

      visit '/'

      click_on "Log in"

      expect(current_path).to eq(login_path)

      fill_in :username, with: username
      fill_in :password, with: password
      within('#login_form') do
        click_on "Log in"
      end

      expect(current_path).to eq(user_path(user))
      expect(page).to have_link("Log out")

      click_on "Log out"
      expect(current_path).to eq(root_path)
    end
  end

  context 'fills out a registration form' do
    it 'should make a user account successfully' do
      username = 'octocat'

      visit '/'

      click_on 'Register'

      expect(current_path).to eq(new_user_path)

      fill_in :user_username, with: username
      fill_in :user_password, with: 'supersecret12345'

      click_on 'Create User'

      expect(current_path).to eq(user_path(User.last))
      expect(page).to have_content("Welcome, #{username}")
    end

    it 'should not allow duplicate usernames' do
      username = 'octocat'
      User.create(username: username, password: 'secret')

      visit new_user_path

      fill_in :user_username, with: username
      fill_in :user_password, with: 'supersecret12345'

      click_on 'Create User'

      expect(current_path).to eq(users_path)
      expect(page).to have_content('Registration failed')
    end
  end
end
