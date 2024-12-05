require "test_helper"

class UsersTest < ActionDispatch::IntegrationTest
  test "user sign up" do
    visit root_path

    click_on "Sign up"

    fill_in "First_Name" , with: "John"
    fill_in "Last_Name" , with: "Doe"
    fill_in "Email" , with: "13@test.com"
    fill_in "Password" , with: "password"
    fill_in "Password_Confirmation" , with: "password"

    click_button "Sign Up"

    assert_equal page.current_path, root_path

    refute page.has_content?("Sign up")
    
  end

  test "user can not sign up with invalid information" do
    visit signup_path

    fill_in "First_Name" , with: "John"
    fill_in "Last_Name" , with: "Doe"
    fill_in "Email" , with: "13test.com" # no @ in email
    fill_in "Password" , with: "password"
    fill_in "Password_Confirmation" , with: "password"

    click_button "Sign Up"

    
  end
end
