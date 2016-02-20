class CreateTypCountries < ActiveRecord::Migration
  def change
    create_table :typ_countries do |t|
      t.string :country
      t.string :postal_code
      t.string :geonameid
      t.timestamps null: false
    end
  end
end