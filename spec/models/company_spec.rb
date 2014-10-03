require 'spec_helper'

RSpec.describe Company, :type => :model do
  it "is valid with a name, information, location" do
  	company = create(:company)
  	expect(company).to be_valid
  end

  it "is invalid without a name" do
  	company = Company.new(name: nil)
  	expect(company.valid?).to be_falsey
  	expect(company.errors[:name].size).to eq(1)	
  end

  it "is invalid without information" do
  	company = Company.new(information: nil)
  	expect(company.valid?).to be_falsey
  	expect(company.errors[:information].size).to eq(1)
  end

  it "is invalid without a location" do
  	company = Company.new(location: nil)
  	expect(company.valid?).to be_falsey
  	expect(company.errors[:location].size).to eq(1)
  end
end
