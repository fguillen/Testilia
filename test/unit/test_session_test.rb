require 'test_helper'

class TestSessionTest < ActiveSupport::TestCase
  def test_update_status
    user = Factory(:user)
    exam = Factory(:exam)
    question_1 = Factory(:question)
    question_2 = Factory(:question)
    cell_1 = Factory(:cell, :exam => exam, :question => question_1)
    cell_2 = Factory(:cell, :exam => exam, :question => question_2)
    test_session = Factory(:test_session, :exam => exam, :user => user)
    answer_1 = Factory(:answer, :question => question_1, :test_session => test_session)
    answer_2 = Factory(:answer, :question => question_2, :test_session => test_session)
    
    test_session.touch
    assert_equal('no-completed', test_session.status)
    
    answer_1.update_attributes( :selected => 'b' )
    test_session.touch
    assert_equal('no-completed', test_session.status)
    
    answer_2.update_attributes( :selected => 'b' )
    test_session.touch
    assert_equal('completed', test_session.status)
  end
end
