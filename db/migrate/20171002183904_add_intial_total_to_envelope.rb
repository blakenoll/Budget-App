class AddIntialTotalToEnvelope < ActiveRecord::Migration[5.0]
  def change
    add_column "envelopes", "initialTotal", :integer, precision: 8, scale: 2
  end
end
