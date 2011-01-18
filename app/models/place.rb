class Place < ActiveRecord::Base
  has_many :meetings
  
  def self.as_options
    Place.all.collect{ |place| [place.name, place.id] }
  end
  
end
