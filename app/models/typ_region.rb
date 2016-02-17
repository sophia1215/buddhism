# == Schema Information
#
# Table name: typ_regions
#
#  id             :integer          not null, primary key
#  name           :string
#  timezone       :string
#  typ_country_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class TypRegion < ActiveRecord::Base
	belongs_to :typ_country, foreign_key: "typ_country_id"
	has_many :member_contacts
end
