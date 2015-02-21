class AddReportCensoredToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :censor_approved, :boolean
  end
end
