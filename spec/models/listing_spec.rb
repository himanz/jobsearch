require 'spec_helper'

describe Listing do
  it "is valid with a role, company and location" do
  	listing = create(:listing)
  	expect(listing).to be_valid
  end

  it "is invalid without a role" do
  	listing = Listing.new(role: nil)	
  	expect(listing.valid?).to be_falsey
  	expect(listing.errors[:role].size).to eq(1)
  end

  it "is invalid without a company" do
  	listing = Listing.new(company: nil)
  	expect(listing.valid?).to be_falsey
  	expect(listing.errors[:company].size).to eq(1)
  end

  it "is invalid without a location" do
  	listing = Listing.new(location: nil)
  	expect(listing.valid?).to be_falsey
  	expect(listing.errors[:location].size).to eq(1)
  end

  it "returns only listings that are up to 2 weeks old" do 
  	listing = create(:listing)
  	listing2 = create(:listing2)
  	listing3 = create(:expired_listing)
  	listings = Listing.query_non_expired
  	expect(listings).to match_array([listing, listing2])
  end
end
