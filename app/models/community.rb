class Community < ActiveRecord::Base
	acts_as_inkwell_community
  validates :name, presence: true
  # validates :name, uniqueness: true
end
