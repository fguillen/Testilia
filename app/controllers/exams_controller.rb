class ExamsController < ApplicationController
  before_filter :require_user
  
  def index
    @exams = Exam.all
  end
end
