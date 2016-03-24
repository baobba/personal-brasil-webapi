class CreatePersonalClients < ActiveRecord::Migration
  def change
    create_table :personal_clients do |t|
      t.integer :personal_id, null: false
      t.integer :client_id, null: false
      t.string :objective
      t.decimal :fat_weight, :precision => 6, :scale => 2
      t.decimal :thin_weight, :precision => 6, :scale => 2
      t.decimal :fat_pct, :precision => 6, :scale => 2

      t.timestamps null: false
    end
  end
end
