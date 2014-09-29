class Listing < ActiveRecord::Base
	validates :role, :company, :location, presence: true

	def self.query_non_expired
		where("created_at >= ?", 2.week.ago.utc)
	end

	def self.find_by_date(date)
		where(created_at: date.beginning_of_day..date.end_of_day )
	end

	def create_date
		created_at.to_date
	end

	def create_date_month_day
		created_at.to_date.to_formatted_s(:short)
	end
end
