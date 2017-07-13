FactoryGirl.define do

  factory :message do
    message               "test"
    user_id               "1"
    group_id              "1"
    image File.open(File.join(Rails.root, '/spec/fixtures/Manchester-city.jpg'))

  end

end
