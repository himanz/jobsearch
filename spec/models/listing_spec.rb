require 'spec_helper'

describe Listing do
  it "is valid with a role, company and location" do
  	listing = create(:listing)
  	expect(listing).to be_valid
  end

  it "is invalid without a role"
  it "is invalid without a company"
  it "is invalid without a location"
end
