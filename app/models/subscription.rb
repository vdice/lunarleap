class Subscription < ActiveRecord::Base
  belongs_to :user
  validates :author_id, presence: true
  validates_uniqueness_of :author_id
end
