module AuthenticationMacros
  def login_user(user_properties = {})
    user = FactoryBot.create :user, user_properties
    visit login_path
    fill_in "email" , with: user.email
    fill_in "password" , with: user.password
    click_button "Login"
  end

  def reset_login
    visit logout_path
  end

  def setup_counselor(counselor_properties = {})
    Counselor.create!(
      {
        first_name: "Default",
        last_name: "Counselor",
        specialization: "General",
        email: "default@example.com",
        phone: "555-123-4567"
      }.merge(counselor_properties)
    )
  end
    
end