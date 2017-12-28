class AddTwilioNumberColumnToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :twilio_number, :string
  end
end
