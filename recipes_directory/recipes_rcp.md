Recipes Model and Repository Classes Design Recipe
Copy this recipe template to design and implement Model and Repository classes for a database table.

1. Design and create the Table
If the table is already created in the database, you can skip this step.

Otherwise, follow this recipe to design and create the SQL schema for your table.

In this template, we'll use an example table artists

# EXAMPLE

Table: recipes

  
Columns:
id, recipe, names, cooking time, rating


2. Create Test SQL seeds
Your tests will depend on data stored in PostgreSQL to run.

If seed data is provided (or you already created it), you can skip this step.

```sql

TRUNCATE TABLE recipes RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO "public"."recipes" ("name", "cooking_time", "rating") VALUES
('Spaghetti', '15', '5'),
('A pie', '10', '4'),
('Salad', '5', '1');

```
Run this SQL file on the database to truncate (empty) the table, and insert the seed data. Be mindful of the fact any existing records in the table will be deleted.

psql -h 127.0.0.1 recipes_directory_test < seeds_recipes.sql


3. Define the class names
Usually, the Model class name will be the capitalised table name (single instead of plural). The same name is then suffixed by Repository for the Repository class name.

Table name : recipes
```ruby
# Model Class

class Recipe
end

# Repo Class

class RecipeRepository
end
```

4. Implement the Model class
Define the attributes of your Model class. You can usually map the table columns to the attributes of the class, including primary and foreign keys.

# EXAMPLE
# Table name: 


```ruby
# Model class
# (in lib/artist.rb)

class Recipe

  # Replace the attributes by your own columns.
  attr_accessor :id, :name, :cooking_time, :rating
end
# The keyword attr_accessor is a special Ruby feature
# which allows us to set and get attributes on an object.
```

5. Define the Repository Class interface
Your Repository class will need to implement methods for each "read" or "write" operation you'd like to run against the database.

Using comments, define the method signatures (arguments and return value) and what they do - write up the SQL queries that will be used by each method.

# EXAMPLE
# Table name: recipes

# Repository class
# (in lib/artist_repository.rb)
```ruby
class RecipeRepository

  # Selecting all records
  # No arguments

  def all
    # Executes the SQL query:
    # SELECT id, name, cooking_time, rating FROM recipes;
    # Returns an array of Recipe objects.
  end

  # Gets a single record by its ID
  # One argument: the id (number)

  def find(id)
    # Executes the SQL query:
    # SELECT id, name, cooking_time, rating FROM recipes WHERE id = $1;
    # Returns a single Recipe object.
  end
end
```
6. Write Test Examples
Write Ruby code that defines the expected behaviour of the Repository class, following your design from the table written in step 5.

These examples will later be encoded as RSpec tests.

# EXAMPLES
```ruby
# 1
# Get all recipes


repo = RecipeRepository.new
recipes = repo.all

recipes.length # => 3
recipes.first.id # => '1'
recipes.first.name # => 'Spaghetti'
recipes.first.cooking_time # => '15'
recipes.first.rating # => '5'

#2 - Get a single recipe

repo = RecipeRepository.new

recipe = repo.find(1)

recipe.name # => 'Spaghetti'
recipe.cooking_time # => '15'
recipe.rating # => '5'

#3 Get another recipe

repo = ArtistRepository.new

recipe = repo.find(3)

recipe.name # => 'Salad'
recipe.cooking_time # => '5'
recipe.rating # => '1'



```


7. Reload the SQL seeds before each test run
Running the SQL code present in the seed file will empty the table and re-insert the seed data.

This is so you get a fresh table contents every time you run the test suite.

```ruby
# EXAMPLE

# file: spec/student_repository_spec.rb

def reset_students_table
  seed_sql = File.read('spec/seeds_recipes.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'recipes_directory_test' })
  connection.exec(seed_sql)
end

describe StudentRepository do
  before(:each) do 
    reset_students_table
  end

  # (your tests will go here).
end

```

8. Test-drive and implement the Repository class behaviour
After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.