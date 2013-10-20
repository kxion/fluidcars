class Reservation
  include Mongoid::Document

  belongs_to :rent
  
  field :start, type: DateTime
  field :end, type: DateTime
  field :status, type: String, default: '可预订'

  def self.in_callendar(c_start, c_end)
    any_of({ "$and" => [{ "start" => { "$gte" => c_start }}, { "start" => { "$lte" => c_end } }] }, { "$and" => [{ "end" => { "$gte" => c_start }}, { "end" => { "$lte" => c_end } }] })
  end

  def json_events 
    {
      'start' => self.start,
      'end' => self.end,
      'title' => self.status,
    }
  end

end
