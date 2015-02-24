# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  parent_ids :text             default("[]")
#  child_ids  :text             default("[]")
#  owner_id   :integer
#  owner_type :string
#

class Category < ActiveRecord::Base
	acts_as_inkwell_category
end
