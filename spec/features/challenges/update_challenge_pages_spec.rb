require 'rails_helper'

describe 'the edit a challenge process' do
  before do
    @challenge = FactoryGirl.create(:challenge)
    @user = FactoryGirl.create(:user, challenges: [@challenge])
    login_as(@user)
  end

  it 'cannot attempt to edit a challenge if not same user' do
    login_as(FactoryGirl.create(:user, :username => 'Evildoer', :email => 'evil@doer.com'))
    visit user_challenge_path(@user, @challenge)
    expect(page).to_not have_css '#edit-challenge-link'
    visit edit_user_challenge_path(@user, @challenge)
    expect(page).to have_content 'not authorized'
  end

  it 'can edit a challenge', js: true do
    visit user_challenge_path(@user, @challenge)
    click_on 'edit-challenge-link'
    fill_in 'Name', :with => '42 Jumping Jacks a Day!'
    find('input[type="submit"]').click
    expect(page).to have_content '42 Jumping Jacks a Day!'
  end

  it 'throws error if name is left blank', js: true do
    visit user_challenge_path(@user, @challenge)
    click_on 'edit-challenge-link'
    fill_in 'Name', :with => ''
    find('input[type="submit"]').click
    expect(page).to have_content 'errors'
  end
end
