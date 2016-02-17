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

require 'rails_helper'

RSpec.describe TypRegion, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
