require 'rails_helper'

describe 'the add a challenge process' do
  before do
    @user = FactoryGirl.create(:user)
  end

  it 'cannot add a challenge if not logged in' do
    visit root_path
    expect(page).to_not have_content 'Challenges'
  end

  it 'can add a challenge', js: true do
    login_as(@user)
    visit user_challenges_path(@user)
    expect(page).to have_content 'You don\'t have any challenges, yet!'
    click_on 'new-challenge-link'
    fill_in 'Name', :with => 'Push-up Challenge'
    fill_in 'Description', :with => 'Do 42 push-ups every day'
    find('input[type="submit"]').click
    expect(page).to have_content 'Push-up Challenge'
  end

  it 'throws error if name is left blank', js: true do
    login_as(@user)
    visit user_challenges_path(@user)
    click_on 'new-challenge-link'
    find('input[type="submit"]').click
    expect(page).to have_content 'errors'
  end
end