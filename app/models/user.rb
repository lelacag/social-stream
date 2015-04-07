# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime
#  updated_at             :datetime
#  avatar_file_name       :string
#  avatar_content_type    :string
#  avatar_file_size       :integer
#  avatar_updated_at      :datetime
#  facebook_link          :string
#  twitter_link           :string
#  vine_link              :string
#  username               :string
#  follower_count         :integer          default("0")
#  following_count        :integer          default("0")
#  community_count        :integer          default("0")
#

class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook, :twitter, :google_oauth2, :yahoo]

  # has_many :communities, dependent: :destroy
  # has_many :communities_users, :class_name => 'Inkwell::CommunityUser', dependent: :destroy
  has_many :posts
  acts_as_inkwell_user
  has_attached_file :avatar, styles: { medium: '300x300>', thumb: '100x100#' }, default_url: 'avatar.gif'
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  validates :username, presence: true, if: Proc.new { self.provider.nil? }
  validates :username, uniqueness: true, if: Proc.new { self.provider.nil? }

  attr_accessor :phrase
  validates :phrase, presence: true, if: Proc.new { |user| user.phrase }

  def email_required?
    super && provider.blank?
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      if auth.provider == 'yahoo'
        user.username = auth.info.nickname.gsub(/\s+/, "").downcase
      else
        user.username = auth.info.name.gsub(/\s+/, "").downcase
      end
      user.email = auth.info.email if auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name
      user.image_url = auth.info.image
      # if auth.provider == "facebook"
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at) if auth.credentials.expires_at
      # end
      user.save!
    end
  end
end
