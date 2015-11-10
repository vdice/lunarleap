require 'rails_helper'

describe 'the view other users\' challenges process' do
  before do
    @update = FactoryGirl.create(:update)
    @challenge = FactoryGirl.create(:challenge, updates: [@update])
    @user = FactoryGirl.create(:user, challenges: [@challenge])
    @viewer = FactoryGirl.create(:user, :username => 'Bosphorus', :email => 'bos@phorus.com')
    login_as(@viewer)
  end

  it 'can view all users' do
    visit users_path
    click_on @user.username
    expect(page).to have_content @challenge.name
  end

  it 'can view a user\'s challenge', js: true do
    visit user_challenges_path(@user)
    click_on @challenge.name
    expect(page).to have_content @challenge.description
    click_on @update.title
    expect(page).to have_content @update.body
  end
end
