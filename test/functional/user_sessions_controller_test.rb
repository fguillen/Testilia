require 'test_helper'

class UserSessionsControllerTest < ActionController::TestCase
  def test_should_get_new
    get :new
    assert_response :success
  end
  
  def test_should_create_user_session
    user = Factory(:user, :password => 'wadus', :password_confirmation => 'wadus')
    post :create, :user_session => { :email => user.email, :password => 'wadus' }
    assert user_session = UserSession.find
    assert_equal user, user_session.user
    assert_redirected_to exams_path
    assert_not_nil( flash[:notice] )
  end
  
  def test_should_destroy_user_session
    delete :destroy
    assert_nil UserSession.find
    assert_redirected_to new_user_session_path
    assert_not_nil( flash[:notice] )
  end
end
