module BaiduMap  
  require 'net/http'
  require 'cgi'

  def http_get(domain,path,params)
    return Net::HTTP.get(domain, "#{path}?".concat(params.collect { |k,v| "#{k}=#{CGI::escape(v.to_s)}" }.join('&'))) if not params.nil?
    return Net::HTTP.get(domain, path)
  end

  #参见：Geocoding API v2.0[http://developer.baidu.com/map/webservice-geocoding.htm]
  #获取车辆的地理位置信息
  #返回数据的格式：
  #{
  # status: 0,   Int 返回结果状态值， 成功返回0，其他值请查看附录。
  # result: 
  # {
  #     location: 
  #     {
  #         lng: 116.30814954222, 经度 float
  #         lat: 40.056885091681  纬度 float
  #     },
  #     precise: 1,      Int 位置的附加信息，是否精确查找。1为精确查找，0为不精确。
  #     confidence: 80,  Int 可信度
  #     level: "商务大厦"  地址类型
  # }
  #}
  def get_gps_from_baidu_map
    # url = "http://api.map.baidu.com/geocoder/v2/?address="+self.location+"&city="+self.city+"&output=json&ak=D6ced4fa35c14b09189fba6b898c905f"
    params = { address: self.detail, city: self.city, output: 'json', ak: 'D6ced4fa35c14b09189fba6b898c905f'}
    
    response = JSON.parse(http_get("api.map.baidu.com", "/geocoder/v2/", params))

    # while response['status'] != 0 
    #   response = JSON.parse(http_get("api.map.baidu.com", "/geocoder/v2/", params))
    # end

    begin
      self.gps = [].push(response['result']['location']['lng'], response['result']['location']['lat'])
    rescue
      self.gps = nil
    end

  end


  # 参见：http://developer.baidu.com/map/ip-location-api.htm
  # 根据request.remote_ip定位用户的位置
  # 请求url  http://api.map.baidu.com/location/ip?ak=D6ced4fa35c14b09189fba6b898c905f&ip=x.x.x.x&coor=bd09ll
  # 返回数据，例如
  # {
  #   address: "CN|北京|北京|None|CHINANET|1|None",   #地址
  #   content:       #详细内容
  #   {
  #     address: "北京市",   #简要地址
  #     address_detail:      #详细地址信息
  #     {
  #       city: "北京市",        #城市
  #       city_code: 131,       #百度城市代码
  #       district: "",           #区县
  #       province: "北京市",   #省份
  #       street: "",            #街道
  #       street_number: ""    #门址
  #     },
  #     point:               #百度经纬度坐标值
  #     {
  #       x: "116.39564504",
  #       y: "39.92998578"
  #     }
  #   },
  #   status: 0     #返回状态码
  # } 
  def locate_by_ip(remote_ip)
    params = { ip: remote_ip, ak: 'D6ced4fa35c14b09189fba6b898c905f', coor: 'bd0911'}
    response = JSON.parse(http_get("api.map.baidu.com", "/location/ip", params))
    response
  end
end