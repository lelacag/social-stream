# == Schema Information
#
# Table name: communities
#
#  id                  :integer          not null, primary key
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  owner_id            :integer
#  default_user_access :string           default("w")
#  public              :boolean          default("true")
#  user_count          :integer          default("1")
#  writer_count        :integer          default("1")
#  admin_count         :integer          default("1")
#  muted_count         :integer          default("0")
#  banned_count        :integer          default("0")
#  invitation_count    :integer          default("0")
#  name                :string
#  image_file_name     :string
#  image_content_type  :string
#  image_file_size     :integer
#  image_updated_at    :datetime
#  at_the_beginning    :boolean
#  domain              :string
#

class Community < ActiveRecord::Base
  acts_as_inkwell_community
  validates :name, presence: true
  validates :name, uniqueness: true

  has_attached_file :image, styles: { medium: '300x300>', thumb: '400x400>' }, default_url: 'no_image.png'
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
