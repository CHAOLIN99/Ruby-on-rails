require "test_helper"

class UsersTest < ActionDispatch::IntegrationTest
  test "user can sign up" do
    visit root_path

    click_on "Sign up"

    fill_in "First name", with: "John"
    fill_in "Last name", with: "Doe"
    fill_in "Email", with: "john@test.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"

    click_button "Sign Up"

    assert_equal page.current_path, root_path
    assert_text "signed up"

    assert_text "Logged out"
    refute page.has_content?("Sign up")
  end
end
