require 'rails_helper'

RSpec.describe 'Root page', type: :feature do
  scenario 'Root page' do
    visit root_path
    expect(page).to have_content('My users datatables in github')
    expect(page).to have_content('Search:')
    # expect(page).to have_content('First name')
    # expect(page).to have_content('Last name')
    # expect(page).to have_content('Birthday')
    # expect(page).to have_content('Adderess')
    # expect(page).to have_content('Actions')
    expect(page).to have_content('New User')
  end
end

expect(page).to have_content 'Invalid email or password'
click_button 'Sign in'