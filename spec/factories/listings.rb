# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :listing do
    role "Ruby Developer"
    company "Ruby Workshop"
    location "Toronto, ON"
  end
end
