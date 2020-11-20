class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer :account_id
      t.integer :product_id
      t.text :title
      t.text :review

      t.timestamps
    end
  end
end
