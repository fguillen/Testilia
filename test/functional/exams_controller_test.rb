require 'test_helper'

class ExamsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Exam.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Exam.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Exam.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to exam_url(assigns(:exam))
  end
  
  def test_edit
    get :edit, :id => Exam.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Exam.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Exam.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Exam.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Exam.first
    assert_redirected_to exam_url(assigns(:exam))
  end
  
  def test_destroy
    exam = Exam.first
    delete :destroy, :id => exam
    assert_redirected_to exams_url
    assert !Exam.exists?(exam.id)
  end
end
