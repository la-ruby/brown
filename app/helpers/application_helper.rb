module ApplicationHelper
  def spacer(height)
    "<div style='height: #{height}px;'>&nbsp;</div>".html_safe
  end
end
