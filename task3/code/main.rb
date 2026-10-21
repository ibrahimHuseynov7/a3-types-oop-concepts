# It is our Library class I have declared it using class as we have in Python
class LibraryItem
  attr_reader :title, :author, :year
# We have initialize function that takes 3 arguments using def similar as Python
  def initialize(title, author, year)
    @title = title
    @author = author
    @year = year
  end

  # it is kind of our common properties
  def display_info
    print "Title: #{@title}\n"
    print "Author: #{@author}\n"
    print "Year: #{@year}\n"
  end
end

# Book has a genre, I have "<" for inheritance
class Book < LibraryItem
  attr_reader :genre
# using super as in python we can achieve inheritance
  def initialize(title, author, year, genre)
    super(title, author, year)
    @genre = genre
  end
# it has its own display_info which is different compared to its parent
  def display_info
    print "Book \n"
    super
    print "Genre: #{@genre}\n"
    print "\n"
  end
end

# DVD has a director and genre
class DVD < LibraryItem
  attr_reader :genre

  def initialize(title, director, year, genre)
    super(title, director, year)
    @genre = genre
  end

  def director
    @author
  end
# same as before it has its own print style
  def display_info
    print "DVD \n"
    print "Title: #{@title}\n"
    print "Director: #{director}\n"
    print "Year: #{@year}\n"
    print "Genre: #{@genre}\n"
    print "\n"
  end
end

# CD has an artist and a genre
class CD < LibraryItem
  attr_reader :genre
# again using super keyword
  def initialize(title, artist, year, genre)
    super(title, artist, year)
    @genre = genre
  end

  def artist
    @author
  end

  def display_info
    print "CD\n"
    print "Title: #{@title}\n"
    print "Artist: #{artist}\n"
    print "Year: #{@year}\n"
    print "Genre: #{@genre}\n"
    print "\n"
  end
end
# it is our Library class that stores and manages a collection of library items
class Library
  def initialize
    @items = []   # private and it means only Library methods can change it
  end

  def add_item(item)
    @items << item
    print "Added:#{item.title}\n"
  end

  def remove_item(title)
    item = @items.find { |i| i.title == title } # for finding relevant items
    if item
      @items.delete(item) # we can use delete keyword
      print "Removed: #{title}\n"
    else
      print "Not found: #{title}\n"
    end
  end
  
  # Now I will use apply polymorphism
  def display_item(item)
    item.display_info
  end

  def display_all_items
    print "All items in the library (#{@items.size})\n"
    @items.each do |item|
      display_item(item)
    end
  end
end
    
# I have created instances of different library items
book = Book.new("Generics", "", 2026, "Programming")
dvd = DVD.new("Dəli Kür", "İsmayıl", 2010, "National movie")
cd = CD.new("A Day at the Races", "Queen", 1976, "Rock")

# Display items individually
book.display_info
dvd.display_info
cd.display_info

# I will create a library and add items to items

library = Library.new
library.add_item(book)
library.add_item(dvd)
library.add_item(cd)
print "\n" 
# It will display all information about items in the library
library.display_all_items

# Remove an item and show the library again
library.remove_item("Dəli Kür")
print "\n"
library.display_all_items