class RenameIntrodutionColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :introdution, :profile
  end
end
