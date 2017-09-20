class CreatePurchases < ActiveRecord::Migration[5.1]
  def change
    create_table :purchases do |t|
      t.date :date
      t.string :purchasename
      t.integer :costpurchased
      t.integer :quantitypurchased

      t.timestamps
    end
  end
end
