require 'test_helper'

class AdminSessionIntegrationTest < ActionController::IntegrationTest
  def test_login
    user = Factory(:user, :password => 'wadus', :password_confirmation => 'wadus')
    
    visit login_path
    
    fill_in "Email", :with => user.email
    fill_in "Password", :with => "wadus"

    click_button "Login"
    
    assert_contain( 'Login successful!' )
    assert_equal( user.id, session['user_credentials_id'] )
  end
  
  def test_logout
    user = Factory(:user, :password => 'wadus', :password_confirmation => 'wadus')

    # loginuser
    post 'User_session', :user_session => {:email => user.email, :password => 'wadus'}
    
    visit logout_path
    
    assert_contain( 'Logout successful!' )
  end
end