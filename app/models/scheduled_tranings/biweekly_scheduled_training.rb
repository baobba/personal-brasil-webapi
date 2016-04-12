# == Schema Information
#
# Table name: scheduled_trainings
#
#  id                 :integer          not null, primary key
#  personal_client_id :integer
#  type               :string           not null
#  starts_at          :time             not null
#  ends_at            :time             not null
#  initial_date       :date             not null
#  end_date           :date
#  day_of_week        :integer          not null
#  day_of_month       :integer          not null
#  day_of_year        :integer          not null
#  recurring_data     :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class BiweeklyScheduledTraining < ScheduledTraining
  
  def add_schedule_rule(schedule)
    schedule.add_recurrence_rule IceCube::Rule.weekly().day(self.day_of_week)
  end

  def get_schedule_comparison_period(date)
    (date.beginning_of_week)..(date.beginning_of_week + 2.weeks)
  end

  def has_overlap_appointments
    # BiweeklyScheduledTraining.find_any_overlap(self.personal_client.training_sessions, self.personal_client.schedule_trainings, self.date, self.starts_at, self.ends_at, self.ends_at_date, self.id).length > 0
    false # não vamos verificar overlapping
  end

  def self.find_any_overlap(owner_children, owner_recurring, start_date, starting, ending, ends_at_date, base_id)
    ScheduleModule::Biweekly::find_any_overlap(owner_children, owner_recurring, start_date, starting, ending, ends_at_date, base_id, schedule_types, base_id_field)
  end
end
