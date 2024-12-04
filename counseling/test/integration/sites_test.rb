require "test_helper"

class SitesTest < ActionDispatch::IntegrationTest
   test "home page works" do
    visit root_path

    assert_selector "h1", text: "Welcome"
    
   end
end
