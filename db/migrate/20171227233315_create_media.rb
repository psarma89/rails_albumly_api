class CreateMedia < ActiveRecord::Migration[5.1]
  def change
    create_table :media do |t|
      t.string :name
      t.string :ext
      t.string :type
      t.string :url
      t.integer :event_id

      t.timestamps
    end
  end
end
