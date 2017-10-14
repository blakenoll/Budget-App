class AddForeignKeysToEnvelope < ActiveRecord::Migration[5.0]
  def change
    add_column "transactions", "user_id", :integer
    add_column "transactions", "envelope_id", :integer
    add_foreign_key :transactions, :users
    add_foreign_key :transactions, :envelopes
  end
end
