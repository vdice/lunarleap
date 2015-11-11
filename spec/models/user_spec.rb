require 'rails_helper'

RSpec.describe User, type: :model do
  it {should have_many :challenges}
  it {should have_many :subscriptions}
  it {should validate_presence_of :username}
end
