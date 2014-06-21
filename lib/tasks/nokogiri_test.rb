require 'rubygems'
require 'nokogiri'
require 'open-uri'

url = "http://prod3.agileticketing.net/websales/pages/list.aspx?epguid=5e3ea987-8f29-408f-ad74-5c32388b1f83&"
doc = Nokogiri::HTML(open(url))
doc.css(".DaysRow td").each do |day|
	start_date = day.at_css(".Date").text
	
	day.css(".Item").each do |event|

	  title = event.at_css(".Name").text
	  start_time = event.at_css(".Time , span").text
	  start_date = day.at_css(".Date").text
	  url = "http://prod3.agileticketing.net/websales/pages/"+event.at_css(".ViewLink")[:href]
	  puts "#{title} - #{start_date} - #{start_time} - #{url}"
	end

end
