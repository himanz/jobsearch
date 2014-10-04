	require 'spec_helper'

	feature "Companies management" do
		scenario "Add a new company" do
			company = create(:company)
			visit new_company_path
			expect {
				fill_in "Name", with: company.name
				fill_in "Information", with: company.information
				fill_in "Location", with: company.location
				click_button "Submit"
			}.to change(Company, :count).by(1)
			expect(current_path).to eq company_path(company.id + 1)
			expect(page).to have_content "Ruby Inc"
			expect(page).to have_content "Great place to work."
			expect(page).to have_content "Toronto, ON"
		end

		scenario "Edit a company" do
			company = create(:company)
			visit edit_company_path(company)
			expect{
				fill_in 'Name', with: "Python Dojo"
				fill_in 'Information', with: "We are in Python"
				click_button 'Submit'
			}.to_not change(Company, :count)
			expect(current_path).to eq company_path(company)
			expect(page).to have_content "Python Dojo"
			expect(page).to have_content "We are in Python"
			expect(page).to have_content "Toronto, ON"
		end
	end