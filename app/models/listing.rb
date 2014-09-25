class Listing < ActiveRecord::Base
	validates :role, :company, presence: true
end
