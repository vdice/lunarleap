require 'rails_helper'

describe 'the show an update process' do
  before do
    @update = FactoryGirl.create(:update)
    @challenge = FactoryGirl.create(:challenge, updates: [@update])
    @user = FactoryGirl.create(:user, challenges: [@challenge])
    login_as(@user)
  end

  it 'can show an update', js: true do
    visit user_challenge_path(@user, @challenge)
    click_on @update.title
    expect(page).to have_content @update.body
  end

  it 'can hide an update', js: true do
    visit user_challenge_path(@user, @challenge)
    click_on @update.title
    find("#update-body-#{@update.id}").click
    expect(page).to_not have_content @update.body
  end
end
