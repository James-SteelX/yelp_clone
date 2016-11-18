require 'rails_helper'

describe Restaurant, type: :model do
  it 'is not valid with a name of less than three characters' do
    User.create(email:'test@example.com',password:'test')
    restaurant = Restaurant.new(name: "kf",user: User.first)
    expect(restaurant).to have(1).error_on(:name)
    expect(restaurant).not_to be_valid
  end
end

describe Restaurant do
  it 'is not valid unless it has a unique name' do
    User.create(email:'test@example.com',password:'test')
    Restaurant.create(name: "Moe's Tavern", user: User.first)
    restaurant = Restaurant.new(name: "Moe's Tavern")
    expect(restaurant).to have(1).error_on(:name)
  end
end

describe 'reviews' do
  describe 'build_with_user' do
    let(:user) { User.create email: 'test@test.com'}
    let(:restaurant) { Restaurant.create name: 'Test' }
    let(:review_params) { {rating: 5, thoughts: 'yum'} }
    subject(:review) { restaurant.reviews.build_with_user(review_params, user)}
    it 'builds a review' do
      expect(review).to be_a Review
    end
    it 'builds review associated with the specified user' do
      expect(review.user).to eq user
      end
    end
  end
