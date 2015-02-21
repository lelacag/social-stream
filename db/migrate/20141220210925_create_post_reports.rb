class CreatePostReports < ActiveRecord::Migration
  def change
    create_table :post_reports do |t|
      t.integer :user_id
      t.integer :post_id

      t.timestamps null: false
    end
  end
end
