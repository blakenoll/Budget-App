class CreateEnvelopes < ActiveRecord::Migration[5.0]
  def change
    create_table :envelopes do |t|
      t.decimal :total, precision: 8, scale: 2
      t.string :name
      t.timestamps
    end
  end
end
