class User < ActiveRecord::Base
    
    has_many :reviews
    has_many :products, through: :reviews

    def review
        self.reviews
    end
    def user
        self.users
    end

    def favorite_product
        self.reviews.order(:star_rating).last
    end

    def remove_reviews(product)
        self.reviews.where(product: product).destroy_all
    end
end