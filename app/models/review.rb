class Review < ApplicationRecord
  belongs_to :user
  belongs_to :reviewable, polymorphic: true

  after_create do 
    user.review_count+= 1
    user.save
  end 

  after_destroy do 
    user.review_count -= 1 
    user.save
  end 

end
