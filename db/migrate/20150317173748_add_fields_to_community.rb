class AddFieldsToCommunity < ActiveRecord::Migration
  def change
    add_column :communities, :at_the_beginning, :boolean
    add_column :communities, :domain, :string
  end
end
