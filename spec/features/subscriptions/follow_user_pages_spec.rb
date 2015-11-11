require 'rails_helper'

describe 'the follow a user process' do
  before do
    @challenge = FactoryGirl.create(:challenge)
    @user = FactoryGirl.create(:user, challenges: [@challenge])
    @follower = FactoryGirl.create(:user, :username => 'Bosphorus', :email => 'bos@phorus.com')
    login_as(@follower)
  end

  it 'allows a user to follow another user', js: true do
    visit user_challenges_path(@user)
    find('#follow-button').click
    expect(page).to have_content "Unfollow"
  end

  it 'allows a user to unfollow another user', js: true do
    @subscription = @follower.subscriptions.new(:author_id => @user.id)
    @subscription.save
    visit user_challenges_path(@user)
    click_link 'Unfollow'
    expect(page).to have_content "Unfollow"
  end

  it 'cannot follow themselves' do
    visit user_challenges_path(@follower)
    expect(page).to_not have_content 'Follow'
  end
end
