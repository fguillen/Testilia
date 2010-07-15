require 'test_helper'



class EscuelaBalear::CVSProcessorTest < Test::Unit::TestCase
  # def test_html_to_cvs
  #   File.open( "/tmp/test.cvs", 'w') do |f|
  #     f.write EscuelaBalear::CVSProcessor.html_to_cvs( "#{RAILS_ROOT}/test/fixtures/escuela_balear/test_2.html" )
  #   end
  # end
  # 
  # def test_convert_all_html_to_cvs
  #   EscuelaBalear::CVSProcessor.convert_all_html_to_cvs
  # end
  
  def test_convert_question_html_to_cvs
    question_html_1 = File.read( "#{RAILS_ROOT}/test/fixtures/escuela_balear/question_1.html" )
    question_html_2 = File.read( "#{RAILS_ROOT}/test/fixtures/escuela_balear/question_2.html" )
    question_html_4 = File.read( "#{RAILS_ROOT}/test/fixtures/escuela_balear/question_4.html" )
    question_html_5 = File.read( "#{RAILS_ROOT}/test/fixtures/escuela_balear/question_5.html" )
    question_html_6 = File.read( "#{RAILS_ROOT}/test/fixtures/escuela_balear/question_6.html" )
    
    assert_equal( 
      '"73","Legislación","La Administración establece una zona de navegación, cuando se navega cerca de un acantilado, que dista:","50 metros","25 metros","200 metros","100 metros","a"',
      EscuelaBalear::CVSProcessor.convert_question_html_to_cvs( question_html_1 )
    )
    
    assert_equal(
      '"2","Tecnología Naval","La pieza que forma la parte superior de la borda se llama:","Cáncamo","Regala","Cubierta","Plan","b"',
      EscuelaBalear::CVSProcessor.convert_question_html_to_cvs( question_html_2 )
    )
    
    assert_equal(
      '"3","Tecnología Naval","Hélice de paso múltiple o variable es aquella que:","El paso no es proporcional a la circunferencia descrita","Se pueden rebatir las palas sobre el eje","Tiene poco diámetro y poco paso","Tiene un mecanismo que permite modificar la posición de las palas dándoles el paso requerido","d"',
      EscuelaBalear::CVSProcessor.convert_question_html_to_cvs( question_html_4 )
    )
    
    assert_equal(
      '"39","Comunicaciones","En radiotelefonía los períodos de silencio son:","Durante los minutos 13 a 15 y 43 a 45 de cada hora","Durante los minutos 27 a 30 y 57 a 60 de cada hora","Durante los minutos 00 a 03 y 30 a 33 de cada hora","--","c"',
      EscuelaBalear::CVSProcessor.convert_question_html_to_cvs( question_html_6 )
    )
  end
  
end