require 'rubygems'
require 'nokogiri'
require 'open-uri'
# put your importer code here
url="http://prod3.agileticketing.net/websales/pages/list.aspx?epguid=5e3ea987-8f29-408f-ad74-5c32388b1f83&"
doc = Nokogiri::HTML(open(url))
#puts doc.at_css("Name").text
doc.css(".event").each do |event|
  event_name = item.at_css(".Name").text
  #start_date = item.at_css(".epgColor2Back").text
  #start_time = item.at_css(".Time , span").text
  #url = item.at_css(".ViewLink")[:href]
  puts "#{event_name}" 
  
  #puts "- #{start_date} - #{start_time}"
  #puts "#{url}"
  
end




# 