class PostReport < ActiveRecord::Base
  belongs_to :post
  
  def censor
    self.post.censor_approved = true
    self.post.save
  end
end
