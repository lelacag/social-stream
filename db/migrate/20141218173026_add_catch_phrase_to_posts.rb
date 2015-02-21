class AddCatchPhraseToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :catch_phrase, :string
  end
end
