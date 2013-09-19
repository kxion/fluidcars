class Picture
  include Mongoid::Document

  belongs_to :car
  mount_uploader :image, PictureUploader

  field :image, type: String
  field :image_cache, type: String
  field :car_token, type: String
  
  def output_json
    {
      "name" => read_attribute(:image),
      "size" => image.size,
      "url" => image.url,
      "delete_url" => id,
      "picture_id" => id,
      "delete_type" => "DELETE"
    }.to_json
  end

end
