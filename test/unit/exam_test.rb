require 'test_helper'

class ExamTest < ActiveSupport::TestCase
  def test_create_from_cvs
    exam = nil
    
    assert_difference "Question.count", 75 do
      assert_difference "Exam.count", 1 do
        exam = Exam.create_from_cvs( 'exam_name', "#{RAILS_ROOT}/test/fixtures/test_1.cvs" )        
      end
    end
    

  end
end
