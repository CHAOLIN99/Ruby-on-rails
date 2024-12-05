class UserDecorator < Draper::Decorator
  delegate_all

  # Define custom methods for decoration
  def full_name
    "#{object.first_name} #{object.last_name}"
  end
end
