require 'rails_helper'

feature 'reviewing' do
  before { Restaurant.create name: 'KFC' }

  scenario 'allows users to leave a review using a form' do
    visit('/')
    sign_up
    add_review
    expect(current_path).to eq '/restaurants'
    click_link 'KFC'
    expect(page).to have_content('so so')
  end

  scenario 'user is not logged in' do
    visit('/')
    expect(page).to have_link('Sign in and review')
  end

  scenario 'users cant leave 2 reviews for same restaurant' do
    sign_up
    add_review
    expect(page).to have_content('You have already reviewed this restaurant')
  end

end
