class Question < ActiveRecord::Base
  has_many :cells, :dependent => :destroy
  has_many :exams, :through => :cells
  
  def self.create_from_cvs( cvs_line )
    fields = cvs_line.split( '","' )
    # 
    # t.string   "subject"
    # t.string   "answer_a"
    # t.string   "answer_b"
    # t.string   "answer_c"
    # t.string   "answer_d"
    # t.integer  "answer_correct"
    # t.string   "category"
    # t.string   "level"
    # 
    # "1","Tecnología Naval","La misión de las lumbreras es:","Dar acceso cuando el yate está atracado","Recoger el agua de la lluvia","Dar luz y ventilación a los departamentos","Achicar el agua en las sentinas","3"
    # 
    
    question = 
      Question.create!(
        :subject => fields[2].gsub( /^"|"$/, '' ),
        :answer_a => fields[3].gsub( /^"|"$/, '' ),
        :answer_b => fields[4].gsub( /^"|"$/, '' ),
        :answer_c => fields[5].gsub( /^"|"$/, '' ),
        :answer_d => fields[6].gsub( /^"|"$/, '' ),
        :answer_correct => fields[7].gsub( /^"|"$|\n/, '' ),
        :category => fields[1].gsub( /^"|"$/, '' )
      )
    
    return question
  end
end
