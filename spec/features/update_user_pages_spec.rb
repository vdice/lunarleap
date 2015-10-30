require 'rails_helper'

describe 'the user update process' do
  before do
    @user = FactoryGirl.create(:user)
    login_as(@user)
  end

  it 'can update a user', js: true do
    visit user_path(@user)
    click_link 'edit-user-link'
    fill_in 'Username', :with => 'Steve'
    find('input[type="submit"]').click
    expect(page).to have_content 'Steve'
  end

  it 'throws error if username left blank' do
    visit user_path(@user)
    click_link 'edit-user-link'
    fill_in 'Username', :with => ''
    find('input[type="submit"]').click
    expect(page).to have_content 'errors'
  end

  it 'can add an avatar' do
    visit edit_user_path(@user)
    page.attach_file("Avatar", 'spec/fixtures/images/avatar.jpeg')
    find('input[type="submit"]').click
    expect(page).to have_content @user.avatar
  end
end
