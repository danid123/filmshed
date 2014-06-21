require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'active_record'
require 'pq'

url = "http://prod3.agileticketing.net/websales/pages/list.aspx?epguid=5e3ea987-8f29-408f-ad74-5c32388b1f83&"
doc = Nokogiri::HTML(open(url))
doc.css(".DaysRow td").each do |day|
	
	day.css(".Item").each do |event|
		event = Event.new
		event.title = event.at_css(".Name").text
		start_day = day.at_css(".Date").text
		event.start_date = "06/"+start_day+"/2014"
		event.start_time = event.at_css(".Time , span").text
		event.url = "http://prod3.agileticketing.net/websales/pages/"+event.at_css(".ViewLink")[:href]
		event.save
	  
	  
	  
	  
	  #puts "#{title} - #{start_date} - #{start_time} - #{url}"
	end

end
