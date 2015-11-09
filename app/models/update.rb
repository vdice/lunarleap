class Update < ActiveRecord::Base
  belongs_to :challenge
  validates :title, presence: true
  validates :body, presence: true
end
