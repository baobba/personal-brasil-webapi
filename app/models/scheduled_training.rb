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

class ScheduledTraining < ActiveRecord::Base
  include ScheduleModule::Core

  belongs_to :personal_client

  has_many :training_sessions

  before_validation :fill_cache_data
  before_validation :generate_recurring_data

  validates :personal_client, :type, presence: true
  validates :initial_date, :starts_at, :ends_at, :day_of_week, :day_of_month, :day_of_year, presence: true
  validates :recurring_data, presence: true
  
  validate :type_not_abstract, :validate_overlap_appointments

  def fill_cache_data
    self.day_of_week = initial_date.wday
    self.day_of_month = initial_date.day
    self.day_of_year = initial_date.yday
  end

  def schedule
    @schedule ||= IceCube::Schedule.from_yaml(recurring_data) rescue nil
    @schedule
  end

  def add_schedule_rule
  end

  def schedule=(schedule)
    @schedule = schedule
  end

  def list_children_in_period(start_date, end_to_date)
    comparison_method = method(:get_schedule_comparison_period)
    create_method = method(:create_empty_child)

    return list_children(start_date, end_to_date, self.training_sessions, comparison_method, create_method)
  end

  def serializable_hash options=nil
    super.merge "type" => type
  end

  def get_schedule_comparison_period(date)
    date..date
  end

  protected
    def type_not_abstract
      if type == ScheduleModule.name
        errors.add(:type, "não pode ser abstrato.")
      end
    end

    def validate_overlap_appointments
      if has_overlap_appointments
        errors.add(:starts_at, "Período agendado em uso.")
      end
    end

    def create_empty_child(recurrency_date)
      child = TrainingSession.new
      child.personal_client = self.personal_client
      child.scheduled_training = self
      child.date = recurrency_date
      child.starts_at = self.starts_at
      child.ends_at = self.ends_at
      child
    end

    def self.schedule_types
      { weekly: 'WeeklyScheduledTraining', biweekly: 'BiweeklyScheduledTraining' }
    end

    def self.base_id_field
      TrainingSession.base_id_field
    end

    def create_schedule(date, ends_at_date)
      create_new_schedule(date, ends_at_date)
    end

  private
    def generate_recurring_data
      if initial_date_changed? || end_date_changed? || type_changed?
        @schedule = create_schedule(initial_date, end_date)
        add_schedule_rule(@schedule)

        self.recurring_data = @schedule.to_yaml
      end
    end
end
