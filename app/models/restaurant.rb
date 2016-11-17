class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy
  validates :name, length: { minimum: 3 }, uniqueness: true

  has_many :reviews,
      -> { extending WithUserAssociationExtension },
      dependent: :destroy
end

# def build_review(attributes = {}, user)
#   review = reviews.build(attributes)
#   review.user = user
#   end
