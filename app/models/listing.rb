class Listing < ActiveRecord::Base
	validates :role, :company, :location, presence: true

	def self.query_non_expired
		where("created_at >= ?", 2.week.ago.utc)
	end
end
