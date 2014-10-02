class Listing < ActiveRecord::Base
	validates :role, :company, :location, :description, presence: true

  # Finds listings that are up to 14 days old from created
	def self.query_non_expired
		where("created_at >= ?", 2.week.ago.utc)
	end

  # Finds listings that are created on a certain date
	def self.find_by_date(date)
		where(created_at: date.beginning_of_day..date.end_of_day )
	end

  # Displays date in a readable format
	def create_date
		created_at.to_date
	end

  # Displays date in a human readable format
	def create_date_month_day
		created_at.to_date.to_formatted_s(:short)
	end
end
