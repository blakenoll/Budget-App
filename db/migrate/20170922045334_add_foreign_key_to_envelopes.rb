class AddForeignKeyToEnvelopes < ActiveRecord::Migration[5.0]
  def change
    add_column "envelopes", "user_id", :integer
    add_foreign_key :envelopes, :users
  end
end
