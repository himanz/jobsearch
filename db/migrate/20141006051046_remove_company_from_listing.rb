class RemoveCompanyFromListing < ActiveRecord::Migration
  def change
    remove_column :listings, :company, :string
  end
end
