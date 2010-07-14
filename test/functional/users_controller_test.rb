require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  def setup
    activate_authlogic
    @user = Factory(:user)
    UserSession.create( @user )
  end
  
  def test_should_get_new
    get :new
    assert_response :success
  end
  
  def test_should_create_user
    assert_difference('User.count') do
      post :create, :user => { :email => "email@email.com", :password => "benrocks", :password_confirmation => "benrocks" }
    end
    
    assert_redirected_to users_path
    assert_not_nil( flash[:notice] )
  end
  
  def test_should_get_edit
    user = Factory(:user)
    get :edit, :id => user.id
    assert_response :success
  end
  
  def test_should_update_user
    user = Factory(:user)
    put :update, :id => user.id, :user => { }
    assert_redirected_to users_path
    assert_not_nil( flash[:notice] )
  end
  
  def test_should_destroy
    user = Factory(:user)
    delete :destroy, :id => user.id
    assert_redirected_to users_path
    assert_not_nil( flash[:notice] )
    assert( !User.exists?(user.id) )
  end
end
