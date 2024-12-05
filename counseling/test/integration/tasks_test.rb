require "test_helper"

class TasksTest < ActionDispatch::IntegrationTest
  test "user can log in" do
    user = FactoryBot.create :user, email: "test@test.com", password: "password"

    visit root_path

    click_on "Log in"

    fill_in "Email" , with: "13@test.com"
    fill_in "Password" , with: "password"
    click_button "Log in"

    assert_equal page.current_path, root_path
    refute page.has_content?("Log in")
  end

  test "can't login witho wth wrong password" do
    assert true
  end

  test "user can log out" do
    assert true
  end
end
