require "test_helper"

class CounselorsTest < ActionDispatch::IntegrationTest
  test "find counslors" do
    visit root_path
    
    visit counselors_path
  end

  test "create a new counselor" do
    visit counselors_path

    click_on "New Counselor"

    fill_in "First Name", with: "John"
    fill_in "Last Name", with: "Doe"
    fill_in "Specialization", with: "Marriage"
    fill_in "Email", with: "test@test.com"
    fill_in "Phone", with: "123-456-7890"
  end

  
end
