require_relative 'activity'

class Reunion
  attr_reader :location, :activities

  def initialize(location, activity)
    @location = location
    @activities = [activity]
  end

  def add_activities(new_activity)
    @activities << new_activity
  end

end
