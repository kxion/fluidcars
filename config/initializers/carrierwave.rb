
# CarrierWave.configure do |config|
#   config.storage = :upyun
#   config.upyun_username = "loveltyoic"
#   config.upyun_password = "tyzl1988"
#   config.upyun_bucket = "fluidcars"
#   config.upyun_bucket_domain = "fluidcars.b0.upaiyun.com"
# end
# CarrierWave.configure do |config|  
#   config.storage = :file
    
#   # Storage access url  
#   # config.grid_fs_access_url = "/upload/grid"  
# end
  CarrierWave.configure do |config|
    config.storage             = :qiniu
    config.qiniu_access_key    = "FpVY_TiUPLceH8YgrVOBRIChLuQBaIbJe146hnKd"
    config.qiniu_secret_key    = 'XFCPK_JHXZCl4PpRk5kTLbn4HFT3bK8uLfhEl9w9'
    config.qiniu_bucket        = "fluidcars"
    config.qiniu_bucket_domain = "fluidcars.qiniudn.com"
    config.qiniu_block_size    = 4*1024*1024
    config.qiniu_protocal      = "http"
  end