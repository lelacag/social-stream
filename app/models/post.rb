class Post < ActiveRecord::Base
  belongs_to :user
  has_many :post_reports
  acts_as_inkwell_post
  
  scope :approved, -> { where(censor_approved: nil) }
end
