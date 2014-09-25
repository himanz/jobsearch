class Listing < ActiveRecord::Base
	validates :role, :company, :location, presence: true
end
