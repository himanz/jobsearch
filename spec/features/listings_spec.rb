require 'spec_helper'

feature 'Listing management' do
	scenario "click link of a listing in index" do
    create(:listing)

		visit listings_path
		click_link 'Ruby Developer'
		expect(page).to have_content "Ruby Developer"
		expect(page).to have_content "Ruby Workshop"
		expect(page).to have_content "Toronto, ON"
	end
end