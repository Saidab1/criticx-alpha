class Review < ApplicationRecord
  belongs_to :user, counter_cache: :review_count
  belongs_to :reviewable, polymorphic: true

end
