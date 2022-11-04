class Product < ActiveRecord::Base
    # has_many :users, through: :reviews
    has_many :reviews
    has_many :users, through: :reviews
#     `Product#reviews`
#   - returns a collection of all the Reviews for the Product
# - `Product#users`
#   - returns a collection of all the Users who reviewed the Product
def review
    self.reviews
end
def user
    self.users
end
def leave_review(user, star_rating, comment)
 Review.create(star_rating: star_rating, comment: comment)
end
def print_all_reviews
     self.reviews.each {|review| review.print_review}
end

def average_rating
self.reviews.average(:star_rating).to_f
end
end