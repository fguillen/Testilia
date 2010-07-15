module EscuelaBalear
  class CVSProcessor
    def self.html_to_cvs( html_file_path )
      html = File.read( html_file_path )


    
      # delete header
      html = html.to_a[48..-1].join
    
      # delete footer
      html = html.to_a[0..-22].join
    
      # delete empty lines
      html = html.strip
    
      # split questions and process
      cvs_result = ""
      html.split( '</ol>' ).each do |question_html|
        question_cvs = EscuelaBalear::CVSProcessor.convert_question_html_to_cvs( question_html )
        cvs_result << "#{question_cvs}\n"
      end
    
      return cvs_result
    end
  
    def self.convert_question_html_to_cvs( question_html )
      question_html = question_html.strip
    
      # <b>Tecnología Naval.</b><br>
      # 3. Hélice de paso múltiple o variable es aquella que:<br>
      # <font color="red"><b>RESPUESTA INCORRECTA!</b></font>
      # <ol><b>La respuesta correcta es la D: -------- Y tu respuesta ha sido: A</b><br>
      # A. El paso no es proporcional a la circunferencia descrita.<br>
      # B. Se pueden rebatir las palas sobre el eje.<br>
      # C. Tiene poco diámetro y poco paso.<br>
      # D. Tiene un mecanismo que permite modificar la posición de las palas 
      # dándoles el paso requerido.<br>
    
      blocks = question_html.split("<br>").map { |block| block.strip.gsub( "\n", " " ).gsub( "  ", " " ) }
    
      # blocks.each_with_index do |block, index|
      #   puts "blocks[#{index}]: #{block}"
      # end
    
      category = blocks[0].gsub( '<b>', '' ).gsub( '.</b>', '' )
      number = blocks[1].scan( /\A(\d+). / )[0].to_s
      subject = blocks[1].gsub( /\A\d+\. /, '')
      answer_correct = blocks[2].scan( /La respuesta correcta es la (.)/ )[0].to_s.downcase
    
      answer_a = blocks[3].gsub( /\AA. /, '' ).gsub( /\.\z/, '' )
      answer_b = blocks[4].gsub( /\AB. /, '' ).gsub( /\.\z/, '' )
      answer_c = blocks[5].gsub( /\AC. /, '' ).gsub( /\.\z/, '' )
      answer_d = blocks[6].nil? ? '--' : blocks[6].gsub( /\AD. /, '' ).gsub( /\.\z/, '' )
    
      ['category', 'number', 'subject', 'answer_correct', 'answer_a', 'answer_b', 'answer_c', 'answer_d'].each do |variable|
        length = eval( "#{variable}.length" )
        if length == 0
          puts "ERROR: #{variable} empty on html: #{question_html}"
        else
          # puts "OK: #{variable}.length = #{length}"
        end
      end
    
      return "\"#{number}\",\"#{category}\",\"#{subject}\",\"#{answer_a}\",\"#{answer_b}\",\"#{answer_c}\",\"#{answer_d}\",\"#{answer_correct}\""    
    end
    
    def self.convert_all_html_to_cvs
      html_files = "#{RAILS_ROOT}/etc/escuela_balear_tests/html/*.html"
      Dir.glob( html_files ).each do |html_path|
        puts "processing: #{html_path}"
        cvs_content = EscuelaBalear::CVSProcessor.html_to_cvs( html_path )
        cvs_file_path = "#{RAILS_ROOT}/etc/escuela_balear_tests/cvs/#{File.basename( html_path, ".html" )}.cvs"

        puts "writing: #{cvs_file_path}"

        File.open( cvs_file_path, 'w' ) do |f|
          f.write( Iconv.new('utf-8', 'iso-8859-1').iconv(cvs_content) )
        end
      end
    end
  end
end