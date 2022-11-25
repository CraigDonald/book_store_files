# file: app.rb

require_relative 'lib/database_connection'
require_relative 'lib/recipe_repository'

# We need to give the database name to the method `connect`.
DatabaseConnection.connect('recipes_directory_test')

# Perform a SQL query on the database and get the result set.
# sql = 'SELECT id, name, cooking_time, rating FROM recipes;'

# Print out each record from the result set .
# result.each do |record|
#   p record
# end

repo = RecipeRepository.new

result = repo.find(3)
puts result.id, result.name, result.cooking_time, result.rating
