class Restaurant < ApplicationRecord

  validates :name, length: { minimum: 3 }, uniqueness: true

  has_many :reviews,
      -> { extending WithUserAssociationExtension },
      dependent: :destroy

      def build_with_user(attributes = {}, user)
        attributes[:user] ||= user
        reviews.build(attributes)
      end
end

# def build_review(attributes = {}, user)
#   review = reviews.build(attributes)
#   review.user = user
#   end
