class Category < ActiveRecord::Base
  has_and_belongs_to_many :challenges
  validates :name, presence: true
  validates_uniqueness_of :name
end
