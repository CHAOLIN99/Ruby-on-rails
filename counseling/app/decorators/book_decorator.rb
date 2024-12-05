class BookDecorator < Draper::Decorator
  delegate_all

  # Example of a custom method
  def formatted_price
    "$#{'%.2f' % object.price}"
  end

  def short_title
    object.title.truncate(30)
  end
end
