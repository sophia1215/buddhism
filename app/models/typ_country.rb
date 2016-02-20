# == Schema Information
#
# Table name: typ_countries
#
#  id          :integer          not null, primary key
#  country     :string
#  postal_code :string
#  geonameid   :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class TypCountry < ActiveRecord::Base
  has_many :member_contacts
  has_many :typ_regions
end
