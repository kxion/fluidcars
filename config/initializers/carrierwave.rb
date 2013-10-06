
CarrierWave.configure do |config|
  config.storage = :upyun
  config.upyun_username = "loveltyoic"
  config.upyun_password = "tyzl1988"
  config.upyun_bucket = "fluidcars"
  config.upyun_bucket_domain = "fluidcars.b0.upaiyun.com"
end
# CarrierWave.configure do |config|  
#   config.storage = :file
    
#   # Storage access url  
#   # config.grid_fs_access_url = "/upload/grid"  
# end