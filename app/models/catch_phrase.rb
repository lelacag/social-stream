# == Schema Information
#
# Table name: catch_phrases
#
#  id         :integer          not null, primary key
#  phrase     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CatchPhrase < ActiveRecord::Base
end
