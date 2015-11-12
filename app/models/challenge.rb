class Challenge < ActiveRecord::Base
  belongs_to :user
  has_many :updates, dependent: :destroy
  has_and_belongs_to_many :categories
  validates :name, presence: true
end
