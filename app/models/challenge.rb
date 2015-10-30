class Challenge < ActiveRecord::Base
  belongs_to :user
  has_many :updates
  validates :name, presence: true
end
