# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :listing do
    role "Ruby Developer"
    company "Ruby Workshop"
    location "Toronto, ON"
    description "work hard play hard"

    factory :listing2 do
    	role "Python Developer"
    	company "Python Workshop"
    	location "Toronto, ON"
    end

    factory :expired_listing do
    	role "Expire"
    	company "Expire Inc"
    	location "Toronto, ON"
    	created_at (Time.now.utc - 15.days)
    end

    factory :yesterday_listing do
        role "Chef"
        company "Food Inc"
        created_at (Time.now.utc - 1.day)
    end
  end
end
