class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :posts
  has_many :post_reports
  acts_as_inkwell_user
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "avatar.gif"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  
end
