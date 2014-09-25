class Listing < ActiveRecord::Base
	validates :role, presence: true
end
