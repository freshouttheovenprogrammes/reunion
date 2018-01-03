require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'

class ActivityTest < Minitest::Test

  def test_activity_has_correct_attributes
    activity = Activity.new('hiking')

    assert_equal 'hiking', activity.name
    assert_instance_of Hash, activity.participants
  end

  def test_we_can_add_participants_to_activity
    activity = Activity.new('punk show')
    activity.add_participants('suzy', 5)
    activity.add_participants('tad', 5)

    assert_equal ({"suzy"=>5, "tad"=>5}), activity.participants
  end

  def test_we_can_add_total_to_activity
    activity = Activity.new('skiing')
    activity.add_participants('joey', 120)
    activity.add_participants('ann', 120)
    activity.add_participants('micheal', 120)
    activity.add_participants('bilbo', 120)
    activity.add_participants('janice', 120)
    result = activity.calculate_total

    assert_equal 600, result
  end

  def test_we_can_split_total
    activity = Activity.new('boogie_time')
    activity.add_participants('zac', 22)
    activity.add_participants('zach', 5)
    activity.add_participants('amanda', 8)
    result = activity.split_costs(30)

    assert_equal ['zac', -12, 'zach', 5, 'amanda', 2], result
  end

end
