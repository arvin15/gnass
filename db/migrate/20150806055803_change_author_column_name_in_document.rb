class ChangeAuthorColumnNameInDocument < ActiveRecord::Migration
  def change
    rename_column :documents, :author, :author_id
  end
end
