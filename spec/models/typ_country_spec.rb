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

require 'rails_helper'

RSpec.describe TypCountry, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
