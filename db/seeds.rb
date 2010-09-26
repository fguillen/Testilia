# Feeding the database with example tests.. 
# extracted from http://http://www.escuelabalearnautica.com/
# and http://titulosnauticos.net

cvs_files = "#{RAILS_ROOT}/etc/escuela_balear_tests/cvs/*.cvs"
indexes = File.read( "#{RAILS_ROOT}/etc/escuela_balear_tests/tests_index_per.txt" )

puts "cvs_files: #{cvs_files}"

Dir.glob( cvs_files ).each do |cvs_path|
  puts "processing: #{cvs_path}"
  
  exam_id = File.basename( cvs_path, '.cvs' ).scan( /tests_balear_(\d+)/ )[0].to_s
  exam_name = indexes.scan( /^(.+) => \/tests\/test.php\?id=#{exam_id}$/ )[0].to_s
  exam_kind = "Official"
  
  if( exam_name.blank? )
    exam_name = "Test #{exam_id}"
  else
    exam_kind = "Official PER"
  end
  
  exam = Exam.create_from_cvs( exam_name, cvs_path )
  exam.update_attributes( :kind => exam_kind, :position => exam_id )
  
  puts "Exam created: '#{exam.kind} | #{exam.name}'"
end

user = Factory(:user, :email => 'email@email.com', :password => 'pass', :password_confirmation => 'pass' )

puts "User created:"
puts "Email: email@emai.com"
puts "Password: pass"
