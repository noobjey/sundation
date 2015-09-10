class CommitteesTest < ActiveSupport::TestCase

  test "#where" do
    VCR.use_cassette('committee#where') do
      committees = Committee.where(chamber: 'house')
      committee  = committees.first

      assert_equal 'HLZI', committee[:committee_id]
      assert_equal Committee, committee.class
    end
  end
end
