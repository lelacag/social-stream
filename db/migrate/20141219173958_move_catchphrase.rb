class MoveCatchphrase < ActiveRecord::Migration
  def change
    remove_column :posts, :catch_phrase
    
    create_table :catch_phrases do |t|
      t.string :phrase

      t.timestamps null: false
    end
    
  end
end
