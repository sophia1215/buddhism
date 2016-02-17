class CreateMemberContactsMembersJoinTable < ActiveRecord::Migration
  def change
    create_table :member_contacts_members do |t|
      t.integer :member_id, null: false
      t.integer :member_contact_id, null: false
      t.timestamps null: false
    end
  end
end