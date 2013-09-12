module CarsHelper
  def format_date(time)
    "#{time.year}年#{time.month}月#{time.day}日"
  end

  def more_than_one_picture?(pic)
    pic.length > 1 ? true : false
  end

  def how_many_pictures(pic)
    pic.length
  end

  def tag_chn_to_en(tag)
    if tag == '出售'
      return 'sell'
    elsif tag == '求购'
      return 'buy'
    else
      'evaluate'
    end
  end
end
