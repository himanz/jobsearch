# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :company do
    name "Ruby Inc"
    information "Great place to work."
    location "Toronto, ON"

    factory :company2 do
    	name "Python Inc"
    	information "Good place to work"
    end
  end
end
