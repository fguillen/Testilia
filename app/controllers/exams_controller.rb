class ExamsController < ApplicationController
  # before_filter :require_user
  
  def index
    @exams = Exam.find( :all, :conditions => {:kind => 'Official PER'}, :order => :position)
  end
end
