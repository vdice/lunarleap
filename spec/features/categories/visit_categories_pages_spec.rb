require 'rails_helper'

describe 'the visit categories process' do
  before do
    @category = FactoryGirl.create(:category)
    @user = FactoryGirl.create(:user)
    login_as(@user)
  end

  it 'can visit categories', js: true do
    visit categories_path
    click_on @category.name, match: :first
    expect(page).to have_content @category.name
    expect(page).to have_content 'no challenges'
  end
end
