class ExamsController < ApplicationController
  before_filter :require_user
  
  def index
    @exams = Exam.all( :order => :position)
  end
end
