require 'test_helper'

class ExamTest < ActiveSupport::TestCase
  def test_create_from_cvs
    exam = nil
    
    Dir.glob( "#{RAILS_ROOT}/test/fixtures/test_1.cvs" ).each do |cvs_path|
      assert_difference "Question.count", 75 do
        assert_difference "Exam.count", 1 do
          exam = Exam.create_from_cvs( 'exam_name', cvs_path )        
        end
      end
    end
    
    puts exam.questions.first.category
  end
end
