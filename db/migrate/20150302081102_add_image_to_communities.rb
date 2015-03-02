class AddImageToCommunities < ActiveRecord::Migration
  def self.up
    add_attachment :communities, :image
  end

  def self.down
    remove_attachment :communities, :image
  end
end
