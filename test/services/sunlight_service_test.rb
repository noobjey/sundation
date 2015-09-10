require 'test_helper'

class SunlightServiceTest < ActiveSupport::TestCase
  attr_reader :service

  def setup
    @service = SunlightService.new
  end

  test "#legislators" do
    VCR.use_cassette('sunlight_service_test#legislators') do
      legislators = service.legislators(gender: 'F')
      legislator  = legislators.first

      assert_equal 20, legislators.count
      assert_equal 'Joni', legislator[:first_name]
      assert_equal 'Ernst', legislator[:last_name]
    end
  end

  test "#committees" do
    VCR.use_cassette('sunlight_service_test#committees') do
      committees = service.committees(chamber: 'house')

      assert_equal "HLZI", committees.first[:committee_id]
    end
  end
end
