require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'active_record'
require 'pg'

 
domain_url = "http://prod3.agileticketing.net/websales/pages/"
events = ".Item , .ViewLink"
days = ".DaysRow td"
title_field = ".Name"
start_day = ".Date"
time_field = ".Time , span"
url_field = ".ViewLink"
duration_field = "[cpropname^=Running]"

 
calendar_url = "http://prod3.agileticketing.net/websales/pages/list.aspx?epguid=5e3ea987-8f29-408f-ad74-5c32388b1f83&"
calendar = Nokogiri::HTML(open(calendar_url))


calendar.css(days).each do |day|
    if day.css(events).count != 0
	# pulls text value of start day out then adds the month and year for date formatting
    start_date = ("06/"+day.at_css(start_day).text+"/2014" || nil)
	
	day.css(events).each do |event|
		if event 
			if event.at_css(title_field)
				
				# setting default values for fields
				title = (event.at_css(title_field).text || 'title unknown') 
		  		start_time = (event.at_css(time_field).text || nil) 
		  		film_url = domain_url + event.at_css(url_field)[:href] if event.at_css(url_field)
		  		film = Nokogiri::HTML(open(film_url))
		  		# duration_nodes are fetched from film detail page and retrieving two elements with cpropname==Running Time
		  		# The first node is just the text on the page that says "Running Time:" the second has the value of the duration
		  		duration_nodes = film.css(duration_field)

		  		duration = ((duration_nodes.length != 0 && duration_nodes[1].text) || nil)
		  		# puts "#{title} - #{start_date} - #{start_time} - #{duration} - #{film_url}"
		  		
		  	end
		end
	end
	end
end
