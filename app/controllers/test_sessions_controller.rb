class TestSessionsController < ApplicationController
  before_filter :charge_exam
  before_filter :require_user
   
  def show
    @test_session = TestSession.find(params[:id])
  end
  
  def new
    @test_session = @exam.test_sessions.new
    render :action => 'show'
  end
  
  def create
    @test_session = @exam.test_sessions.new(params[:test_session].merge( :user_id => current_user.id))
    if @test_session.save
      @test_session.touch
      flash[:notice] = "Successfully created test_session."
      redirect_to [@exam, @test_session]
    else
      render :action => 'show'
    end
  end
  
  def edit
    @test_session = TestSession.find(params[:id])
    render :action => 'show'
  end
  
  def update
    puts "controller update"
    @test_session = TestSession.find(params[:id])
    if @test_session.update_attributes(params[:test_session])
      flash[:notice] = "Successfully updated test_session."
      redirect_to [@exam, @test_session]
    else
      render :action => 'show'
    end
  end
  
  def destroy
    @test_session = TestSession.find(params[:id])
    @test_session.destroy
    flash[:notice] = "Successfully destroyed test_session."
    redirect_to exams_path
  end
  
  private
    def charge_exam
      @exam = Exam.find( params[:exam_id] )
      
    end
end
