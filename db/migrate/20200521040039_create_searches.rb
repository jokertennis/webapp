class CreateSearches < ActiveRecord::Migration[6.0]
  def change
    create_table :searches ,:id => false do |t|
      t.integer :id
      t.text :title
      t.date :release_date
      t.text :genres
    end
  end
end
