require 'rails_helper'

describe 'the destroy a challenge process' do
  before do
    @challenge = FactoryGirl.create(:challenge)
    @user = FactoryGirl.create(:user, challenges: [@challenge])
    login_as(@user)
  end

  it 'can destroy a challenge', js: true do
    login_as(@user)
    visit user_challenge_path(@user, @challenge)
    expect(page).to have_content @challenge.name
    click_on 'Delete'
    expect(page).to_not have_content @challenge.name
  end

  it 'cannot attempt to destroy a challenge if not same user' do
    login_as(FactoryGirl.create(:user, :username => 'Evildoer', :email => 'evil@doer.com'))
    visit user_challenge_path(@user, @challenge)
    expect(page).to_not have_content 'Delete'
  end
end
