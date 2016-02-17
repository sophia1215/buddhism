class CreateMemberContacts < ActiveRecord::Migration
  def change
    create_table :member_contacts do |t|
      t.string :address1, null: false
      t.string :address2
      t.string :city, null: false
      t.string :postal_code, null: false
      t.string :email, null: false
      t.string :cell_number
      t.float :latitude, null: false
      t.float :longitude, null: false
      t.string :avatar
      t.belongs_to :typ_country
      t.belongs_to :typ_region
      t.belongs_to :member
      t.timestamps null: false
    end
  end
end
