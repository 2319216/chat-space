FactoryGirl.define do

  factory :message do
    message               {Faker::Name.name}
    user_id               "1"
    group_id              "1"
    image File.open(File.join(Rails.root, '/spec/fixtures/Manchester-city.jpg'))

  end
end
