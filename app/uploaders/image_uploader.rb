IMAGE_UPLOADER_ALLOW_IMAGE_VERSION_NAMES = %w(100x100 30x30 800 240 thumbnail)
class ImageUploader < CarrierWave::Uploader::Base
  def store_dir
    "#{model.class.to_s.underscore}/#{mounted_as}"
  end

  # Override url method to implement with "Image Space"
  def url(version_name = "")
    @url ||= super({})
    version_name = version_name.to_s
    return @url if version_name.blank?
    if not version_name.in?(IMAGE_UPLOADER_ALLOW_IMAGE_VERSION_NAMES)
      # To protected version name using, when it not defined, this will be give an error message in development environment
      raise "ImageUploader version_name:#{version_name} not allow."
    end
    [@url,version_name].join("!") # thumb split with "!"
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

end