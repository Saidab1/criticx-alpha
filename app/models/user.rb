class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :reviews 
  validates :username, :email, presence: true 
  validate :birth_date_more_than_sixteen

  def birth_date_more_than_sixteen
    if Date.today.year - birth_date.year  < 16
      errors.add(:birth_date, "You should be 16 years old to create an account")
    end
  end 

end
