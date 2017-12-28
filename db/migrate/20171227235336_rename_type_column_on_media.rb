class RenameTypeColumnOnMedia < ActiveRecord::Migration[5.1]
  def change
    rename_column :media, :type, :media_type
  end
end
