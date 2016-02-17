# == Schema Information
#
# Table name: members
#
#  id         :integer          not null, primary key
#  first_name :string           not null
#  last_name  :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Member < ActiveRecord::Base
	has_and_belongs_to_many :member_contacts
end
