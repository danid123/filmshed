

pages = [1..9]

pages.each do |page|
	# code here..
	page.movies.each do |movie|
		event = Event.new
		event.title = movie.name
		event.start_date = movie.date_started
		# code here..
	end
	# code. here
end

# ----------------- refactor whenever there is a loop ---------------------

pages = [1..9]

pages.each do |page|
	process_movie(page)
end

def process_movies(page)
	page.movies.each do |movie|
		process_movie(movie)
	end
end

def process_movie(movie)
	event = Event.ne
	event.title = movie.name
	event.start_date = movie.date_started
	# code here..
end

# ------------------refactor more hardcore -------------------------------------------

pages = [1..9]
pages.each { |page| process_movie(page) }

def process_movies(page)
	page.movies.each { |movie| process_movie(movie) }
end

def process_movie(movie)
	event = Event.ne
	event.title = movie.name
	event.start_date = movie.date_started
	# code here..
end







class Movie
	# Methods for the Movie class itself
	# Example: 
	#  Movie.list_all

	def self.list_all
		
	end

	def self.since(start_date)

	end

	# Methods instances of movies, eg to use on a created object
	# Example: 
	#   movie = Movie.new
	#   movie.process

	def initialize(event)
	end

	def process
		event
		@title = #somecode
	end

	def create_report
		puts @title  # this will work
	end
end

movie = Movie.new
movie.create_report


booyeah = Movie.new
booyeah.create_report
booyeah.list_all    # method undefined

movies_this_week = Movie.since(7.days.ago)


# Rule of thumb, when you are dealing with collections of movies you will make
# class level methods that start with self. 'Normal' methods are called instance methods.
# Putting @ athe the fornt a variable makes it avaialbe between methods for that instance
# Eg it becomes an instance variable rather than being stuck just inside its scope (eg stuck in the method it was defined in)







