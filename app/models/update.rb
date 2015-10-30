class Update < ActiveRecord::Base
  belongs_to :challenge
  validates :body, presence: true
end
