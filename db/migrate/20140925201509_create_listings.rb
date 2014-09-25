class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :role
      t.string :company
      t.string :location

      t.timestamps
    end
  end
end
