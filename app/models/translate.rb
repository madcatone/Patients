require 'net/http'
require 'open-uri'
require 'uri'
require 'digest/md5'

class Translate < ActiveRecord::Base
  before_create :sys_string_name
  def sys_string_name
    self.result = Translate.new.get_t(self.contact)
  end
  #百度翻译接口::
  attr_accessor :host, :client_id, :from, :to

  def baidu_fanyi
    YAML::load(File.open("#{Rails.root}/config/application.yml"))["baidu_fanyi"]
  end

  def host
    host = baidu_fanyi["host"]
  end

  def appid
    appid = baidu_fanyi["appid"]
  end

  def secretkey
    secretkey = baidu_fanyi["secretkey"]
  end

  def from
    from = baidu_fanyi["from"]
  end

  def to
    to = baidu_fanyi["to"]
  end

  def data(date)
    send_data.body
    results = JSON.parse(send_data.body)
    @text = results["trans_result"][0]["dst"]
  end

  def get_t(contects)
    tmp_arr=[]
    contects.split(",").each do |contect|
      tmp_arr << send_data(contect).to_s.downcase.split.join("_").to_s
    end
    tmp_string=tmp_arr.to_s.delete "[" "]" '""' ","
    @result = tmp_string.to_s.gsub(":_",":")
  end

  #获取翻译数据
  def send_data(query)

    #query = CGI.escape(query)
    #query = query.to_s
    #query = '重量'
    salt = rand(32765..65536)
    sign = appid+query+salt.to_s+secretkey
    sign = Digest::MD5.hexdigest(sign)
    #@url = "#{baidu_fanyi["host"]}appid=#{baidu_fanyi["appid"]}&q=#{query}&from=#{baidu_fanyi["from"]}&to=#{baidu_fanyi["to"]}&salt=#{salt.to_s}&sign=#{sign}"
    @url = "#{host}appid=#{appid}&q=#{query}&from=#{from}&to=#{to}&salt=#{salt.to_s}&sign=#{sign}"
    puts @url
    query = CGI.escape(query)
    @url = "#{host}appid=#{appid}&q=#{query}&from=#{from}&to=#{to}&salt=#{salt.to_s}&sign=#{sign}"
    puts @url
    uri = URI.parse @url
    data = open(@url).read

    #http = Net::HTTP.new(uri.host, uri.port)
    #request = Net::HTTP::Get.new(uri)

    #data = http.request(request).body

    results = JSON.parse(data)
    results["trans_result"][0]["dst"]
    rescue SocketError
    puts "网络错误!"
  end
end