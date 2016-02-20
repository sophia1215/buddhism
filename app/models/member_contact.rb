# == Schema Information
#
# Table name: member_contacts
#
#  id             :integer          not null, primary key
#  address1       :string           not null
#  address2       :string
#  city           :string           not null
#  postal_code    :string           not null
#  email          :string           not null
#  cell_number    :string
#  latitude       :float            not null
#  longitude      :float            not null
#  avatar         :string
#  typ_country_id :integer
#  typ_region_id  :integer
#  member_id      :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class MemberContact < ActiveRecord::Base
	belongs_to :member, foreign_key: "member_id"
	belongs_to :typ_country, foreign_key: "typ_country_id"
	belongs_to :typ_region, foreign_key: "typ_region_id"

  validates :typ_country, presence: true
  validates :typ_region, presence: true
  validates :address1, presence: true
  validates :city, presence: true
  validates :postal_code, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :cell_number, numericality: true, length: {minimum: 10, maximum: 15}, allow_blank: true

  mount_uploader  :avatar, AvatarUploader

  geocoded_by :address
  after_validation :geocode, :if => lambda{ |obj| obj.address1_changed? && obj.city_changed? && obj.postal_code_changed?}

  # Whenever any of the 3 fields below change, then we re-geocode
  def address
    [city, postal_code, address1].compact.join(', ')
  end
end
