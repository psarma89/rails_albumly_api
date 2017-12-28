class RenameMediaIdColumnOnMedia < ActiveRecord::Migration[5.1]
  def change
    rename_column :messages, :media_id, :medium_id
  end
end
