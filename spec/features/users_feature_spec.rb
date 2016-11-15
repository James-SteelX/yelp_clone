require 'rails_helper'

feature "user can sign in and out" do
  context 'user not signed in on the homepage' do
    it 'should see sign in/sign up link' do
      visit('/')
      expect(page).to have_link('Sign in')
      expect(page).to have_link('Sign up')
    end

    it 'should not see sign out link' do
      visit('/')
      expect(page).not_to have_link('Sign out')
    end
  end

  context "user signed in on homepage" do
    before do
      visit('/')
      click_link('Sign up')
      fill_in('Email', with: 'email@email.com')
      fill_in('Password', with: 'verygoodpw')
      fill_in('Password confirmation', with: 'verygoodpw')
      click_button('Sign up')
    end

    it 'should see sign out link' do
      visit('/')
      expect(page).to have_link('Sign out')
    end

    it 'should not see a sign in link' do
      visit('/')
      expect(page).not_to have_link('Sign up')
      expect(page).not_to have_link('Sign in') 
    end
  end
end
