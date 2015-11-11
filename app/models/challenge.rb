class Challenge < ActiveRecord::Base
  belongs_to :user
  has_many :updates, dependent: :destroy
  validates :name, presence: true
end
