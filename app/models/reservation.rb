class Reservation
  include Mongoid::Document

  belongs_to :rent, index: true
  
  field :start, type: DateTime
  field :end, type: DateTime
  field :status, type: String, default: '可预订'

  index ({start: 1})
  
  def self.in_callendar(c_start, c_end)
    # any_of({ "$and" => [{ "start" => { "$gte" => c_start }}, { "start" => { "$lte" => c_end } }] }, { "$and" => [{ "end" => { "$gte" => c_start }}, { "end" => { "$lte" => c_end } }] } \
      # ,{ "$and" => [{"start" => {"$lte" => c_start}}, { "end" => { "$gte" => c_end } }]})
    any_of({ "start" => { "$gte" => c_start, "$lte" => c_end }}, { "end" => { "$gte" => c_start, "$lte" => c_end }}, { "$and" => [{"start" => {"$lte" => c_start}}, { "end" => { "$gte" => c_end } }]})
  end

  def json_events 
    color = (self.status == '可预订') ? '#ED9C28' : '#E2E2E2'
    {
      'start' => self.start,
      'end' => self.end,
      'title' => self.status,
      'color' => color
    }
  end

  def self.find_from_range(o_start, o_end)
    where(:start.lte => o_start, :end.gte => o_end)
  end

end
