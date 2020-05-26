class User < ApplicationRecord
  has_many :reviews 
  validates :username, :email, presence: true 
  validate :birth_date_more_than_sixteen

  def birth_date_more_than_sixteen
    if p Date.today.year - birth_date.year  < 16
      errors.add(:birth_date, "You should be 16 years old to create an account")
    end
  end 

end
