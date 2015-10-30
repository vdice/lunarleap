require 'rails_helper'

RSpec.describe Update, type: :model do
  it {should validate_presence_of :body}
  it {should belong_to :challenge}
end
