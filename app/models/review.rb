class Review < ApplicationRecord
  belongs_to :user, counter_cache: :review_count
  belongs_to :reviewable, polymorphic: true
  validates :title, presence: true, length: { maximun: 40}, uniqueness: true
  validates :body, presence: true 

end
