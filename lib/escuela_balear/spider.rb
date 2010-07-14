require 'rubygems'
require 'mechanize'
require 'uri'

module EscuelaBalear
  class Spider
    def self.go
      (1..160).each do |test_id|
        puts "test #{test_id}"
        File.open( File.expand_path( File.dirname(__FILE__) + "/etc/tests_balear_#{test_id}.html" ), 'w' ) do |f|
          f.write EscuelaBalear::Spider.get( test_id )
        end
      end
    end
  
    def self.get( test_id )
      agent = Mechanize.new
      agent.get( 'http://www.escuelabalearnautica.com/tests/index.php?login=1')
      form = agent.page.forms.first
      form.username = 'FERNANDO GUILLEN'
      form.password = '16586792'
      form.submit
      agent.post(
        'http://www.escuelabalearnautica.com/tests/test.php', 
        {
          'respuesta_usuario' => 'A', 
          'id' => test_id,
          'currow' => 75,
          'respuesta_anterior' => 'D',
          'historico' => '1|C|C;2|B|A;3|D|A;4|A|A;5|D|A;6|A|A;7|D|A;8|C|A;9|D|A;10|D|A;11|D|A;12|A|A;13|C|A;14|C|A;15|B|A;16|A|A;17|B|A;18|C|A;19|A|A;20|B|A;21|D|A;22|D|A;23|C|A;24|D|A;25|B|A;26|D|A;27|B|A;28|C|A;29|D|A;30|B|A;31|C|A;32|C|A;33|B|A;34|C|A;35|C|A;36|A|A;37|C|A;38|D|A;39|C|A;40|A|A;41|C|A;42|A|A;43|D|A;44|D|A;45|B|A;46|A|A;47|B|A;48|A|A;49|B|A;50|A|A;51|C|A;52|D|A;53|A|A;54|D|A;55|D|A;56|D|A;57|D|A;58|B|A;59|C|A;60|C|A;61|A|A;62|C|A;63|D|A;64|A|A;65|D|A;66|A|A;67|B|A;68|A|A;69|B|A;70|A|A;71|A|A;72|A|A;73|A|A;74|D|A;'
        }
      )
      
      return agent.page.body
    end
  
    def self.per_exams
      agent = Mechanize.new
      agent.get( 'http://www.escuelabalearnautica.com/tests/index.php?login=1')
      form = agent.page.forms.first
      form.username = 'FERNANDO GUILLEN'
      form.password = '16586792'
      form.submit
    
      File.open( File.expand_path( File.dirname(__FILE__) + "/etc/tests_index_per.txt" ), 'w' ) do |f|
        agent.page.links.each do |l| 
          f.write( "#{l.text} => #{l.uri}\n" )
        end
      end
    end
  end
end