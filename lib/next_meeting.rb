class NextMeeting
  require 'date'
  
  def self.next_wednesday(current_date)
    current_date.to_date + ((10 - current_date.wday) % 7)
  end
  
  #meeting place and times.
  def self.date(current_time = Time.now)
    current_date = current_time.to_date
    # check for today
    if current_time.day < 8 && current_time.wday == 3
      return "Today"
    else # check for the next wednesday
      next_wed = next_wednesday(current_date)
      return "Next Wednesday (#{next_wed.strftime('%m/%d/%Y')})" if next_wed.day < 8
    end
    # must be next month...  let's be nice and give the date.
    the_next_first = ( current_date - current_date.day + 1 ) >> 1
    meeting_date = next_wednesday(the_next_first)
    return meeting_date.strftime("%m/%d/%Y -- just #{(meeting_date - current_date).to_i} days")
  end
  
  def self.place
    return "Conley's Restaurant, Spokane Valley"
  end
  
  def self.time
    return "6:30 pm"
  end
end