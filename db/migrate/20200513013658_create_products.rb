class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products, :id => false do |t|
      t.integer :id
      t.boolean :adult
      t.text :title
      t.date :release_date
      t.text :homepage
      t.text :overview
      t.text :tagline
      t.text :genres
      t.text :poster_path
      t.text :production_companies
      t.text :production_countries
      t.text :spoken_languages
    end
  end
end
