class ChangeIdBookColumnType < ActiveRecord::Migration
  def change
    change_column :documents, :id_book, :string
  end
end
