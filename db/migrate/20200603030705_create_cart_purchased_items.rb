class CreateCartPurchasedItems < ActiveRecord::Migration[6.0]
  def change
    create_table :cart_purchased_items do |t|
      t.text :title
      t.references :cart, null: false, foreign_key: true

      t.timestamps
    end
  end
end
