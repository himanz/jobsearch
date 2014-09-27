class Listing < ActiveRecord::Base
	validates :role, :company, :location, presence: true

	def self.query_non_expired
		where("created_at >= ?", 2.week.ago.utc)
	end

	def self.find_today
		date = Date.today
		where(created_at: date.beginning_of_day..date.end_of_day )
	end
end
