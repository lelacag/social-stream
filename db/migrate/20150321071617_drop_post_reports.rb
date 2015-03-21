class DropPostReports < ActiveRecord::Migration
  def change
    drop_table :post_reports
  end
end
