require 'spec_helper'

feature 'Listing management' do
  scenario "add a new listing" do
  	listing = create(:listing)
  	visit new_listing_path
  	expect {
  		fill_in 'Role', with: listing.role
  		fill_in 'Company', with: listing.company
  		fill_in 'Location', with: listing.location
  		click_button 'Submit'
  	}.to change(Listing, :count).by(1)
  	expect(current_path).to eq listing_path(listing.id + 1)
  	expect(page).to have_content "Ruby Developer"
		expect(page).to have_content "Ruby Workshop"
		expect(page).to have_content "Toronto, ON"
  end

	scenario "click link of a listing in index" do
    create(:listing)
		visit listings_path
		click_link 'Ruby Developer'
		expect(page).to have_content "Ruby Developer"
		expect(page).to have_content "Ruby Workshop"
		expect(page).to have_content "Toronto, ON"
    expect(page).to have_content Date.today
	end

end