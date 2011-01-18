class Meeting < ActiveRecord::Base
  belongs_to :place
  
  @date = nil
  @time = nil
  
  def date
    return @date if @date
    return self.meeting_at.to_date if self.meeting_at
    return ""
  end
  
  def date=(value)
    return @date = value
  end
  
  def time
    return @time 
    return self.meeting_at.strftime("%I:%M %P") if self.meeting_at
    return ""
  end
  
  def time=(value)
    return @time=value
  end
  
end
