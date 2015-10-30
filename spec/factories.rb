FactoryGirl.define do
  factory :user do
    username 'Telperion'
    email 'telperion@redwoods.com'
    password 'password'
  end

  factory :challenge do
    name 'Push-up Challenge'
    description 'Do 42 Push-ups every day'
  end
end
