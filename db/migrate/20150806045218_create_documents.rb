class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :title
      t.text :body
      t.text :tags
      t.string :company
      t.string :picture
      t.boolean :is_active
      t.integer :id_book
      t.integer :author

      t.timestamps null: false
    end
    add_index :documents, :id_book
    add_index :documents, :author
  end
end
