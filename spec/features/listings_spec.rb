require 'spec_helper'

feature 'Listing management' do
  scenario "add a new listing" do
  	listing = create(:listing)
  	visit new_listing_path
  	expect {
  		fill_in 'Role', with: listing.role
  		fill_in 'Company', with: listing.company
  		fill_in 'Location', with: listing.location
      fill_in 'Description', with: listing.description
  		click_button 'Submit'
  	}.to change(Listing, :count).by(1)
  	expect(current_path).to eq listing_path(listing.id + 1)
  	expect(page).to have_content "Ruby Developer"
		expect(page).to have_content "Ruby Workshop"
		expect(page).to have_content "Toronto, ON"
    expect(page).to have_content "work hard play hard"    
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

  scenario "click description button in index to show description", js: true do
    listing = create(:listing)
    visit listings_path
    click_button "#{listing.id}-description-button"
    expect(page).to have_content "work hard play hard"
    expect(page).to have_content "- Description"
  end

  scenario "click description button in index twice to show description and then hide it", js: true do
    listing = create(:listing)
    visit listings_path
    click_button "#{listing.id}-description-button"
    expect(page).to have_content "work hard play hard"
    click_button "#{listing.id}-description-button"
    expect(page).to have_content "+ Description"
  end

  scenario "click company name in new to autofill relevant fields" do
    company = create(:company)
    listing = create(:listing)
    expect(page).to have_content "Ruby Inc"
    click_link "Ruby Inc"
    expect{
      fill_in 'Role', with: listing.role
      fill_in 'Description', with: listing.description
      click_button 'Submit'
    }.to change(Listing, :count).by(1)
    expect(current_path).to eq listing_path(listing.id + 1)
    expect(page).to have_content "Ruby Inc"
    expect(page).to have_content "Toronto, ON"
    expect(page).to have_content "Great place to work."
  end

end