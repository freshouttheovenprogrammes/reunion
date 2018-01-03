require 'minitest'
require 'minitest/test'
require 'minitest/autorun'
require './lib/reunion'
require './lib/activity'

class ReunionTest < Minitest::Test

  def test_attributes_of_reunion
    reunion = Reunion.new('montana', 'hiking')

    assert_equal 'montana', reunion.location
    assert_equal ['hiking'], reunion.activities
  end

  def test_we_can_add_activity
    reunion = Reunion.new('montana', 'hiking')
    activity_1 = Activity.new('huckleberry_hunt')
    reunion.add_activities(activity_1)

    assert_equal ['hiking', activity_1], reunion.activities
  end

end
