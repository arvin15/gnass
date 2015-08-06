class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :message
      t.integer :document_id

      t.timestamps null: false
    end
    add_index :comments, :document_id
  end
end
