class Company < ActiveRecord::Base
	validates :name, :information, :location, presence: true
end
