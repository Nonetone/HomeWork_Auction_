# frozen_string_literal: true

module PageHelper
  def left_time(time_end)
    time_end - Time.zone.now
  end

  def view_time(time)
    tm = Integer(time.round)
    answer = ''
    answer += "#{(tm / 3600) % 24} hour " if (tm / 3600) % 24 != 0
    answer += "#{(tm / 60) % 60} min " if (tm / 60) % 60 != 0
    answer += "#{tm % 60} sec "
  end
end
