class ListingsController < ApplicationController
	def index
		@listings = Listing.query_non_expired
		@listings_today = @listings.find_by_date(Time.now.utc.to_date)
		@listings_yesterday = @listings.find_by_date(Time.now.utc.to_date.yesterday)
	end

	def show
		@listing = Listing.find(params[:id])

		respond_to do |format|
			format.html { }
		end
	end

	def new
		@listing = Listing.new
	end

	def create
		@listing = Listing.new(listing_params)
		if @listing.save
			redirect_to @listing
		else
			render :new
		end
	end

	def description
		@listing = Listing.find(params[:id])
		respond_to do |format|
			format.html {}
			format.js { render "description" }
		end
	end

  private

	def listing_params
		params.require(:listing).permit(:role, :company, :location, :description)
	end
end
