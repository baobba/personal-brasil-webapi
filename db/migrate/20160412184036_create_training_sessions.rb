class CreateTrainingSessions < ActiveRecord::Migration
  def change
    create_table :training_sessions do |t|
      t.references :personal_client, index: true, foreign_key: true
      t.date :date
      t.time :starts_at
      t.time :ends_at
      t.references :scheduled_training, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
