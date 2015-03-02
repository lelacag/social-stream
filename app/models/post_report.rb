# == Schema Information
#
# Table name: post_reports
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  post_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PostReport < ActiveRecord::Base
  belongs_to :post

  def censor
    post.censor_approved = true
    post.save
  end
end
