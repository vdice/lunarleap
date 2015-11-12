require 'rails_helper'

RSpec.describe Challenge, type: :model do
  it {should belong_to :user}
  it {should have_many :updates}
  it {should have_and_belong_to_many :categories}
  it {should validate_presence_of :name}
end
