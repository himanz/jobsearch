class AddCompanyAttributesToListing < ActiveRecord::Migration
  def change
    add_column :listings, :company_name, :string
    add_column :listings, :company_information, :string
  end
end
