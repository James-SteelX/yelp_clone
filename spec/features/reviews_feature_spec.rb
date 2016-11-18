require 'rails_helper'

feature 'reviewing' do
  before do
    sign_up
    add_restaurant
  end

  scenario 'allows users to leave a review using a form' do
    visit('/')
    add_review
    expect(current_path).to eq '/restaurants'
    click_link 'KFC'
    expect(page).to have_content('so so')
  end

  scenario 'users cant leave 2 reviews for same restaurant' do
    add_review
    expect(page).to have_content('You have already reviewed this restaurant')
  end


  scenario 'user is not logged in' do
    sign_out
    visit('/')
    expect(page).to have_link('Sign in and review')
    end
end
