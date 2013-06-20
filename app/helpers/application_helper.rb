module ApplicationHelper
  def get_error_message(obj,attr)
    if obj.errors[attr].any?
      obj.errors[attr].join(',')
    end
  end


end
