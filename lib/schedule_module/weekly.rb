module ScheduleModule
  module Weekly
    include ScheduleModule::Core

    def find_any_overlap(owner_children, owner_recurring, start_date, starting, ending, ends_at_date, base_id, types, base_id_field)
      all_items = []

      current_date = start_date

      child_type_name = types[:children].present? ? types[:children].name : nil
      items = find_overlapping(owner_children, starting, ending, base_id, child_type_name)
      items = items.where('date_part(\'dow\', date) = ?', current_date.wday)
      items = items.where('date >=  ? ', current_date) 
      items = items.where('date <=  ? ', ends_at_date.to_date) if ends_at_date
      items = items.where.not(base_id_field, base_id) if base_id
      items.concat items.to_a

      if types[:weekly].present?
        items = find_overlapping(owner_recurring, starting, ending, base_id, types[:weekly])
        items = items.where(day_of_week: current_date.wday)
        items = items.where('end_date is null or end_date >= ?', current_date)
        items = items.where('initial_date <=  ? ', ends_at_date.to_date) if ends_at_date
        all_items.concat items.to_a
      end

      if types[:biweekly].present?
        items = find_overlapping(owner_recurring, starting, ending, base_id, types[:biweekly])
        items = items.where(day_of_week: current_date.wday)
        items = items.where('end_date is null or end_date >= ?', current_date)
        items = items.where('initial_date <=  ? ', ends_at_date.to_date) if ends_at_date
        items = items.where('abs(mod(floor(DATE_PART(\'day\', initial_date::timestamp - ?::timestamp))::integer , 2)) = 0', current_date)
        all_items.concat items.to_a
      end
      
      all_items
    end
  end
end