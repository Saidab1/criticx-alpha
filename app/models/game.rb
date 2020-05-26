class Game < ApplicationRecord
    has_many :involved_companies 
    has_many :companies, through: :involved_companies
    has_and_belongs_to_many :platforms 
    has_and_belongs_to_many :genres 
    has_many :expansions, class_name: "Game", foreign_key: "parent_id"
    belongs_to :parent, class_name: "Game", optional: true
    has_many :reviews, as: :reviewable


    enum category: { main_game: 0, expansion: 1}


    validates :name, presence: true, uniqueness: true 
    validates :category, presence: true
    validates :rating, inclusion: 0..100
    validate :parent_exist_if_expansion

    def parent_exist_if_expansion
      if expansion?
        if parent.nil?
          errors.add(:parent, "parent_id is required")
        end 
      end
    end
end
