# Provided, don't edit
require 'directors_database'

# A method we're giving you. This "flattens"  Arrays of Arrays so: [[1,2],
# [3,4,5], [6]] => [1,2,3,4,5,6].

def flatten_a_o_a(aoa)
  result = []
  i = 0

  while i < aoa.length do
    k = 0
    while k < aoa[i].length do
      result << aoa[i][k]
      k += 1
    end
    i += 1
  end

  result
end

def movie_with_director_name(director_name, movie_data)
  { 
    :title => movie_data[:title],
    :worldwide_gross => movie_data[:worldwide_gross],
    :release_year => movie_data[:release_year],
    :studio => movie_data[:studio],
    :director_name => director_name
  }
end


# Your code after this point

def movies_with_director_key(name, movies_collection)
  
  results_arr = [] # Delcare and initalize empty hash
  
  movies_collection.length.times do |movie| # Traverse through movie collection
    # Push the hash returned from the movie_with_director_name onto the empty array results_arr
    results_arr << movie_with_director_name(name,movies_collection[movie]) 
  end

  results_arr
end


def gross_per_studio(collection)
  results_hash = {}
    
  collection.length.times do |movie|
    movie_studio = collection[movie][:studio]
    if(results_hash[movie_studio] == nil)
      results_hash[movie_studio] = collection[movie][:worldwide_gross]
    else
      results_hash[movie_studio] += collection[movie][:worldwide_gross]
    end
  end
  results_hash
end


def movies_with_directors_set(source)
  # GOAL: For each director, find their :movies Array and stick it in a new Array
  #
  # INPUT:
  # * source: An Array of Hashes containing director information including
  # :name and :movies
  #
  # RETURN:
  #
  # Array of Arrays containing all of a director's movies. Each movie will need
  # to have a :director_name key added to it.
  
  source.length.times do |outer_idx|
    puts source[outer_idx]
  end
  
end

# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end
