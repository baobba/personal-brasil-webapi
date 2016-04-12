class CreateScheduledTrainings < ActiveRecord::Migration
  def change
    create_table :scheduled_trainings do |t|
      t.references :personal_client, index: true, foreign_key: true
      t.string :type, null:false

      t.time :starts_at, null:false
      t.time :ends_at, null:false
      
      t.date :initial_date, null:false
      t.date :end_date, null:true

      t.integer :day_of_week, null:false
      t.integer :day_of_month, null:false
      t.integer :day_of_year, null:false
      t.text :recurring_data, null:true

      t.timestamps null: false
    end
  end
end
