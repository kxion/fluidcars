module ApplicationHelper

  def get_error_message(obj,attr)
    obj.errors[attr]
  end

  def error_exist(obj,attr)
    obj.errors[attr].any?
  end

  def convert_to_event_json(rents)
    @events_json = []
    unless rents.nil?
      # @events_json = rents.to_json
      rents.each do |rent|
        @events_json.push({
          start: rent.start,
          title: rent.status,
          allDay: true,
          id: rent.id,
          url: "/rents/#{rent.id}",
          end: rent.end
          })
      end
    end
    @events_json.to_json
  end

  def current_city
    session[:current_city]||'选择城市'
  end

end
