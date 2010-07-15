require 'test_helper'

class ExamsControllerTest < ActionController::TestCase
  def test_index
    5.times{ Factory(:exam, :kind => 'Official PER') }
    get :index
    assert_template 'index'
    assert_equal( 5, assigns(:exams).size )
  end
end
