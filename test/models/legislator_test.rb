require 'test_helper'

class LegislatorTest < ActiveSupport::TestCase
  test "#find_by" do
    VCR.use_cassette('legilator_test#where') do
      legislators = Legislator.where(gender: 'F')
      legislator  = legislators.first

      assert_equal 20, legislators.count
      assert_equal Legislator, legislator.class
      assert_equal 'Joni', legislator.first_name
      assert_equal 'Ernst', legislator.last_name
    end
  end
end
