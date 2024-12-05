require "test_helper"

class CounselorsTest < ActionDispatch::IntegrationTest
  include AuthenticationMacros

  test "find counslors" do
    visit root_path
    
    visit counselors_path
  end

  test "create a new counselor" do
    visit counselors_path

    click_on "New Counselor"

    counselor = setup_counselor(first_name: "John", last_name: "Doe", specialization: "Marriage", email: "test@test.com", phone: "123-456-7890")

    click_button "Create Counselor"
  end

  test "edit a counselor" do
    counselor = setup_counselor(first_name: "John", last_name: "Doe", specialization: "Marriage", email: "test@test.com", phone: "123-456-7890")

    visit counselors_path

    click_on "John"

    click_on "Edit"

    fill_in "First Name", with: "Jane"

    click_button "Update Counselor"

    assert_equal page.current_path, counselor_path(counselor)
  end

  test "delete a counselor" do
    counselor = setup_counselor(first_name: "John", last_name: "Doe", specialization: "Marriage", email: "test@test.com", phone: "123-456-7890")

    visit counselors_path

    click_on "John"

    click_on "Delete"

    assert_equal page.current_path, counselors_path
  end
  

  
end
