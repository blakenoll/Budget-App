class AddEnvelopeNameToTransaction < ActiveRecord::Migration[5.0]
  def change
    add_column "transactions", "envelope_name", :string
  end
end
