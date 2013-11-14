module ApplicationHelper

  def get_error_message(obj,attr)
    obj.errors[attr]
  end

  def error_exist(obj,attr)
    obj.errors[attr].any?
  end

  def convert_events_to_json(rents)
    @events = []
    unless rents.nil?
      # @events_json = rents.to_json
      rents.each do |rent|
        @events.push({
          start: rent.start,
          title: '未预订',
          allDay: true,
          id: rent.id,
          url: "/rents/#{rent.id}",
          end: rent.end
        })
        rent.reservations.each do |reservation|
          @events.push ({
            start: reservation.start,
            title: '已预订',
            allDay: true,
            id: reservation.id,
            end: reservation.end,
            color: '#E2E2E2'
          })
        end
      end
    end
    @events.to_json
  end

  def reservation_events(rent)
    @events = []
    @events.push ({
      start: rent.start,
      title: '可预订',
      allDay: true,
      id: rent.id,
      url: "/rents/#{rent.id}",
      end: rent.end
    })
    rent.reservations.each do |reservation|
      @events.push ({
        start: reservation.start,
        title: '已预订',
        allDay: true,
        id: reservation.id,
        end: reservation.end,
        color: '#E2E2E2'
      })
    end
    @events.to_json
  end


  def current_city
    session[:current_city]||'选择城市'
  end

  def display_notice_and_alert
    msg = ''
    msg << (content_tag :div, notice, :class => "notice") if notice
    msg << (content_tag :div, alert, :class => "alert") if alert
    msg
  end

  def format_date(date)
    date.month+'月'+date.day+'日'
  end

  def format_location(location)
    location.city + location.district + location.detail
  end


end
