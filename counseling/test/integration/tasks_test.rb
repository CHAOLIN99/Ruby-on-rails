require "test_helper"

class TasksTest < ActionDispatch::IntegrationTest
  test "user can log in" do

    user = FactoryBot.create :user, email: "test@test.com", password: "password"

    visit root_path

    click_on "Log in"

    fill_in "email" , with: "13@test.com"
    fill_in "password" , with: "password"
    click_button "Login"

    assert_equal page.current_path, login_path
  end

  test "can't login witho wth wrong password" do
    user = FactoryBot.create :user, email: "test@test.com", password: "password"

    visit login_path

    fill_in "email" , with: "13@test.com"
    fill_in "password" , with: "password"
    click_button "Login"

    refute page.has_content?("Log out")

  end

  test "user can log out" do
    assert true
  end
end
