class User < ApplicationRecord
    has_many :reviews 
    
    before_create do 
      self.review_count = 0
    end 
end
