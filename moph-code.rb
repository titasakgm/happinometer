require 'geocoder'
require 'nokogiri'
require 'open-uri'
require 'pry-nav'

class Hcode
  def initialize(hcode)
    @hcode5 = nil
    @hcode9 = nil
    @location = nil
    @offtype = nil
    @offname = nil
    @telno = nil
    @affiliate = nil
    @address = nil
    if hcode.length == 5
      @hcode5 = hcode
    end
    if hcode.length == 9
      @hcode9 = hcode
    end
    if @hcode5.nil? and !@hcode9.nil?
      hcode5
    elsif !@hcode5.nil? and @hcode9.nil?
      hcode9
    end
    get_info
  end

  def hcode9
    url = "http://203.157.10.8/hcode_2014/query_list.php?"
    url += "maincode=&oldcode=#{@hcode5}&p=3"
    doc = Nokogiri::HTML(open(url))
    @hcode9 = doc.css(".tdcw:nth-child(2)").text[0..8]
  end

  def hcode5
    url = "http://203.157.10.8/hcode_2014/query_list.php?"
    url += "maincode=#{@hcode9}&p=3"
    doc = Nokogiri::HTML(open(url))
    @hcode5 = doc.css(".tdcw:nth-child(3)").text[0..4]
  end

  def get_info
    url = "http://203.157.10.8/hcode_2014/query_detail.php?"
    url += "p=2&code=#{@hcode9}&oldcode=#{@hcode5}&status=01"
    doc = Nokogiri::HTML(open(url))

    @offname = doc.css("tr:nth-child(2) td").text
    @offtype = doc.css("tr:nth-child(3) td").text
    addr1 = doc.css("tr:nth-child(4) td").text
    addr2 = doc.css("tr:nth-child(5) td").text
    ax = addr2.to_s.split(' ')
    addr2 = "#{ax[3]}#{ax[4]} #{ax[1]}#{ax[2]} จังหวัด#{ax[0].to_s.split('.').last}"
    @address = "#{addr1} #{addr2}".to_s.strip.squeeze(' ')
    @telno = doc.css("tr:nth-child(6) td").text
    @affiliate = doc.css("tr:nth-child(7) td").text.split(' ')

    loc = doc.css("tr:nth-child(11) td").text
    loc = loc.tr("\t\n",' ').squeeze(' ').strip
    loc = loc.split('/').last.to_s.strip.split(' ')
    @location = {:lat => loc[3].to_f, :lng => loc[1].to_f}
    if (@location[:lat] == 0.0 or @location[:lng] == 0.0)
      poi = Geocoder.search(@affiliate.join(' '))
      if poi != []
        lat = poi[0].geometry['location']['lat']
        lng = poi[0].geometry['location']['lng']
        @location = {:lat => lat, :lng => lng}
      end
    end
  end

  def offname
    @offname
  end

  def offtype
    @offtype
  end

  def affiliate
    @affiliate
  end

  def location
    @location
  end

  def telno
    @telno
  end

  def address
    @address
  end

end

