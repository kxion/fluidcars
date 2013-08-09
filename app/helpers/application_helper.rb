module ApplicationHelper

  def get_error_message(obj,attr)
    obj.errors[attr]
  end

  def error_exist(obj,attr)
    obj.errors[attr].any?
  end

  def convert_to_event_json(infos)
    @events_json = []
    unless infos.nil?
      # @events_json = infos.to_json
      infos.each do |info|
        @events_json.push({
          start: info.rent_start,
          title: info.status,
          allDay: true,
          id: info.id,
          url: "/infos/#{info.id}",
          end: info.rent_end
          })
      end
    end
    @events_json.to_json
  end

end
