class Picture
  include Mongoid::Document

  belongs_to :car, index: true
  mount_uploader :image, PictureUploader

  field :image, type: String
  field :image_cache, type: String
  field :car_token, type: String
  
  
  def output_json
    {
      "name" => read_attribute(:image),
      "size" => image.size,
      "url" => image.url,
      "thumbnail_url" => image.url+'!160x120',
      "delete_url" => "/pictures/#{self.id}",
      "delete_type" => "DELETE"
    }
  end

end
