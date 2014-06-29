require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'active_record'
require 'pg'

task :thinkful  => :environment do
   puts Event.all.count
end

task :import_nokogiri_test => :environment do 
domain_url = "http://prod3.agileticketing.net/websales/pages/"
listings = ".Item , .ViewLink"
days = ".DaysRow td"
title_field = ".Name"
start_day = ".Date"
time_field = ".Time , span"
url_field = ".ViewLink"
 
url = "http://prod3.agileticketing.net/websales/pages/list.aspx?epguid=5e3ea987-8f29-408f-ad74-5c32388b1f83&"
doc = Nokogiri::HTML(open(url))

# a_day = doc.css(days).first
# puts a_day.at_css(start_day)
doc.css(days).each do |day|
      next if day.css(listings).count == 0
 puts day.css(listings).count
        
# 	doc.css(listings).each do |event|
# 		if event 
# 			if event.at_css(title_field)
# 	  		title = (event.at_css(title_field).text || 'title unknown') 
# 	  	end
# 	  	if event.at_css(start_day)
# 	  		start_date = "06/"+(event.at_css(start_day).text)+"/2014"
# 	  	end
# 	  	if event.at_css(time_field)
# 	  		start_time = (event.at_css(time_field).text || nil) 
# 	  	end
# 	  	if event.at_css(url_field)
# 	  		url = domain_url + event.at_css(url_field)[:href] if event.at_css(url_field)
# 	  	end
# 	  end
# 	  puts "#{title} - #{start_date} - #{start_time} - #{url}"
# 	end
end
end