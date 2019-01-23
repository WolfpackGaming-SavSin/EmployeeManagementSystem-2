module ApplicationHelper
  def flash_class(level)
    case level
    when "success"
      "positive"
    when "error"
      "negative"
    when "alert"
      "negative"
    when "notice"
      "info"
    else
      "info"
    end
  end
end
