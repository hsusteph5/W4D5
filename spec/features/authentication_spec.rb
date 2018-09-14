# spec/features/auth_spec.rb
require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do

  #what is background each ?
  #why validation doesn't work
  background :each do
    visit new_user_path
  end

  scenario 'has a new user page' do
    expect(page).to have_content('signup')
  end


  feature 'signing up a user' do
    scenario 'shows username on the homepage after signup' do
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
