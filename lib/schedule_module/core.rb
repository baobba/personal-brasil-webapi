module ScheduleModule
  module Core
    def find_overlapping(owner_current_items, starting, ending, base_id, type_name = nil)
      items = owner_current_items.where('id != ?', base_id) if base_id && base_id > 0

      starting = starting.change(year: 2000, month: 1, day: 1)
      ending = ending.change(year: 2000, month: 1, day: 1)

      items = items.where(type: type_name) if type_name
      items = items.where(
        # '(starts_at <= #{starting} and ends_at >= #{ending} ) OR ' + # COMECA ANTES OU JUNTO E VAI ATE DEPOIS DO FIM - COBERTO PELO PROXIMO E PELO 4
        '(starts_at < :starting and ends_at > :starting) OR ' +  # COMECA ANTES E VAI ATÉ DEPOIS DO COMECO
        # '(ends_at <= #{starting}) OR ' +  ANTERIOR AO PERIODO - OK
        '(starts_at < :ending and ends_at >= :ending) OR ' +  # COMECA ANTES DO FIM E TERMINA DEPOIS DO FIM
        # '(starts_at >= #{ending}) OR ' +  # POSTERIOR - OK
        '(starts_at >= :starting and ends_at <= :ending)',  # ESTA DENTRO DO PERIODO
        { starting: starting, ending: ending }
      )

      items
    end

    def create_new_schedule(date, ends_at_date)
      if ends_at_date
        return IceCube::Schedule.new(start = date, :end_time => (ends_at_date.to_date + 1.day))
      else
        return IceCube::Schedule.new(start = date)
      end
    end

    def list_children(start_date, end_to_date, base_children, get_schedule_comparison_period, create_new_child)
      children = []
      schedule.occurrences_between(start_date.to_date, (end_to_date + 1.day).to_date, :spans => true).each do |schedule_date|
        recurrency_date = schedule_date.to_date
        found_children = base_children.where(:date => get_schedule_comparison_period.call(recurrency_date))
        if found_children.length > 0
          children.concat found_children.to_a
        else
          children.push create_new_child.call recurrency_date
        end
      end
      children
    end
  end
end