require 'rails_helper'

RSpec.describe Subscription, type: :model do
  it {should validate_presence_of :author_id}
  it {should validate_uniqueness_of :author_id}
  it {should belong_to :user}
end
