module ApplicationHelper
  def title
    base_title = "Micro blog Sample App"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
end
