require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  def test_create_from_cvs
    question = Question.create_from_cvs( File.read( "#{RAILS_ROOT}/test/fixtures/question_1.cvs" ) )
    
    assert_equal( 'La misión de las lumbreras es:', question.subject )
    assert_equal( 'Dar acceso cuando el yate está atracado', question.answer_a )
    assert_equal( 'Recoger el agua de la lluvia', question.answer_b )
    assert_equal( 'Dar luz y ventilación a los departamentos', question.answer_c )
    assert_equal( 'Achicar el agua en las sentinas', question.answer_d )
    assert_equal( 'c', question.answer_correct )
    assert_equal( 'Tecnología Naval', question.category )
  end
end
