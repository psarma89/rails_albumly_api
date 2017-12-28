class ChangeNameColumnMedia < ActiveRecord::Migration[5.1]
  def change
    rename_column :media, :name, :message_sid
  end
end
