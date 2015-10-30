require 'rails_helper'

RSpec.describe Challenge, type: :model do
  it {should belong_to :user}
  it {should have_many :updates}
  it {should validate_presence_of :name}
end