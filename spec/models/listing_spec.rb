require 'spec_helper'

describe Listing do
  it "is valid with a role, company and location" do
  	listing = create(:listing)
  	expect(listing).to be_valid
  end

  it "is invalid without a role" do
  	expect(Listing.new(role: nil)).to have(1).errors_on(:role)
  end

  it "is invalid without a company" do
  	expect(Listing.new(company: nil)).to have(1).errors_on(:company)
  end

  it "is invalid without a location" do
  	expect(Listing.new(location: nil)).to have(1).errors_on(:location)
  end
end
