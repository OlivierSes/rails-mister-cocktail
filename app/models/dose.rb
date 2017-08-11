class Dose < ApplicationRecord
  validates :description, presence: true
  belongs_to :cocktail
  belongs_to :ingredient
  validates_associated :cocktail
  validates_associated :ingredient
  validates :cocktail, uniqueness: {scope: :ingredient}
end
