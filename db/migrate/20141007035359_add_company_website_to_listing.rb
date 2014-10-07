class AddCompanyWebsiteToListing < ActiveRecord::Migration
  def change
    add_column :listings, :company_website, :string
  end
end
