require 'rails_helper'

describe 'the add an update to a challenge process' do
  before do
    @challenge = FactoryGirl.create(:challenge)
    @user = FactoryGirl.create(:user, challenges: [@challenge])
    login_as(@user)
  end

  it 'defaults title text to day of week and date', js: true do
    visit user_challenge_path(@user, @challenge)
    click_on 'new-update-link'
    expect(page).to have_content DateTime.now.strftime("%A, %m/%d/%Y")
  end

  it 'can add an update to a challenge', js: true do
    visit user_challenge_path(@user, @challenge)
    click_on 'new-update-link'
    fill_in 'Title', :with => 'I did 43 actually!'
    fill_in 'Body', :with => 'I did 43 actually!'
    find('input[type="submit"]').click
    expect(page).to have_content 'I did 43 actually!'
  end

  it 'throws error if body is left blank', js: true do
    visit user_challenge_path(@user, @challenge)
    click_on 'new-update-link'
    fill_in 'Body', :with => ''
    find('input[type="submit"]').click
    expect(page).to have_content 'errors'
  end
end
