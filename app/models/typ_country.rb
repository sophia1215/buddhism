# == Schema Information
#
# Table name: typ_countries
#
#  id            :integer          not null, primary key
#  iso           :string
#  iso3          :string
#  fips          :string
#  country       :string
#  continent     :string
#  currency_code :string
#  currency_name :string
#  phone_prefix  :string
#  postal_code   :string
#  languages     :string
#  geonameid     :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class TypCountry < ActiveRecord::Base
  has_many :member_contacts
  has_many :typ_regions
end
