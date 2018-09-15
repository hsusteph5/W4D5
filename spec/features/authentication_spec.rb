# spec/features/auth_spec.rb
require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do
  subject(:user) do
    FactoryBot.build(:user, username: 'Jared', password: 'password')
  end

  background :each do
    visit new_user_path
  end

  scenario 'has a new user page' do
    expect(page).to have_content('signup')
  end


#find by credentials 
  feature 'signing up a user' do
    #get the same user
    #user.
    scenario 'shows username on the homepage after signup' do
      expect(page).to have_content("#{Jared}")
    end

  end
end

feature 'logging in' do
  scenario 'shows username on the homepage after login'

end

feature 'logging out' do
  scenario 'begins with a logged out state'

  scenario 'doesn\'t show username on the homepage after logout'

end
