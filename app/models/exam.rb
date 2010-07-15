class Exam < ActiveRecord::Base
  has_many :cells, :dependent => :destroy
  has_many :questions, :through => :cells
  has_many :test_sessions, :dependent => :destroy
  
  def self.create_from_cvs( exam_name, cvs_path )
    exam = Exam.create!( :name => exam_name )

    # questions
    File.readlines( cvs_path ).each_with_index do |line, index|
      question = Question.create_from_cvs( line )
      exam.cells.create!(
        :position => index + 1,
        :question => question
      )
    end

    return exam
  end
end
