require 'test_helper'

class AnswerTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  def test_update_status
    question = Factory(:question, :answer_correct => 'a')
    answer = Factory(:answer, :question => question)
    assert_equal('empty', answer.status)
    
    answer.update_attributes( :selected => 'b' )
    assert_equal('error', answer.status)
    
    answer.update_attributes( :selected => 'a' )
    assert_equal('ok', answer.status)
  end
end
