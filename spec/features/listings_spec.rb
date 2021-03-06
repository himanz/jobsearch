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

  scenario "click company name in new to autofill relevant fields", js: true do
    company = create(:company)
    listing = create(:listing)
    visit new_listing_path
    expect(page).to have_content "Ruby Inc"
    click_button "Ruby Inc"
    expect{
      fill_in 'Role', with: listing.role
      fill_in 'Description', with: listing.description
      click_button 'Submit'
    }.to change(Listing, :count).by(1)
    expect(current_path).to eq listing_path(listing.id + 1)
    expect(page).to have_content "Ruby Inc"
    expect(page).to have_content "Toronto, ON"
    expect(page).to have_content "Great place to work."
    expect(page).to have_link("http://www.google.com", href: "http://www.google.com") 
  end
  
  scenario "click listing company website link in index" do
    listing = create(:listing, company_website: "http://www.google.com")
    visit listings_path
    expect(page).to have_link("(Ruby Workshop)", href: "http://www.google.com")
    click_link "(Ruby Workshop)"
  end

  scenario "listing with no company website should not have a link to website" do
    listing = create(:listing)
    visit listings_path
    expect(page).to_not have_link("(Ruby Workshop)")
    expect(page).to have_content "(Ruby Workshop)"
  end
end