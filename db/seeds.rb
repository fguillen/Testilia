# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

cvs_files = "#{RAILS_ROOT}/etc/escuela_balear_tests/cvs/*.cvs"
indexes = File.read( "#{RAILS_ROOT}/etc/escuela_balear_tests/tests_index_per.txt" )

puts "cvs_files: #{cvs_files}"

Dir.glob( cvs_files ).each do |cvs_path|
  puts "procession: #{cvs_path}"
  
  exam_id = File.basename( cvs_path, '.cvs' ).scan( /tests_balear_(\d+)/ )[0].to_s
  puts "exam_id: #{exam_id}"
  exam_name = indexes.scan( /^(.+) => \/tests\/test.php\?id=#{exam_id}$/ )[0].to_s
  puts "exam_name: #{exam_name}"
  exam_name = "Test #{exam_id}"  if exam_name.blank?
  puts "exam_name: #{exam_name}"
  
  exam = Factory( :exam, :name => exam_name )

  # questions
  File.readlines( cvs_path ).each_with_index do |line, index|
    question = Question.create_from_cvs( line )
    exam.cells.create!(
      :position => index + 1,
      :question => question
    )
  end
  
  puts "Exam created: '#{exam_name}'"
end

user = Factory(:user, :email => 'email@email.com', :password => 'pass', :password_confirmation => 'pass' )
