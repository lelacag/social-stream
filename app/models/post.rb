# == Schema Information
#
# Table name: posts
#
#  id                        :integer          not null, primary key
#  subject                   :string
#  user_id                   :integer
#  body                      :text
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  censor_approved           :boolean
#  users_ids_who_favorite_it :text             default("[]")
#  users_ids_who_comment_it  :text             default("[]")
#  users_ids_who_reblog_it   :text             default("[]")
#  communities_ids           :text             default("[]")
#

class Post < ActiveRecord::Base
  belongs_to :user
  has_many :post_reports
  acts_as_inkwell_post
  
  scope :approved, -> { where(censor_approved: nil) }
end
