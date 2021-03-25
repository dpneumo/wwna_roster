class DateRange
  attr_reader :start, :stop

  def initialize(start, stop)
    @start, @stop = start, stop
  end

  def includes_date?(date)
    date >= start && date <= stop
  end

  def includes_date_range?(date_range)
    start <= date_range.start && stop >= date_range.stop
  end

  def overlap_date_range?(date_range)
    start <= date_range.stop && stop >= date_range.start
  end

  def to_s
    "#{start.strftime('%d-%B-%Y')}  to  #{stop.strftime('%d-%B-%Y')}"
  end

  def valid?(start, stop)
    return false unless start && stop
    return false unless start.class == Date && stop.class == Date
    stop < start
  end
end
