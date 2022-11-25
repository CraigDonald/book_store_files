require 'recipe_repository'

RSpec.describe RecipeRepository do
    
    def reset_recipes_table
        seed_sql = File.read('spec/seeds_recipes.sql')
        connection = PG.connect({ host: '127.0.0.1', dbname: 'recipes_directory_test' })
        connection.exec(seed_sql)
    end

    before(:each) do 
        reset_recipes_table
    end
    
  # Get all recipes
    it 'selects all recipes' do
        repo = RecipeRepository.new
        recipes = repo.all

        expect(recipes.length).to eq(3) # => 3
        expect(recipes.first.id).to eq("1") # => '1'
        expect(recipes.first.name).to eq('Spaghetti') # => 'Spaghetti'
        expect(recipes.first.cooking_time).to eq('15') # => '15'
        expect(recipes.first.rating).to eq('5') # => '5'
    end

#2 - Get a single recipe
    it 'selects one recipe based on ID' do
        repo = RecipeRepository.new

        recipe = repo.find(1)

        expect(recipe.name).to eq('Spaghetti') # => 'Spaghetti'
        expect(recipe.cooking_time).to eq('15') # => '15'
        expect(recipe.rating).to eq('5') # => '5'
    end

    it 'selects one recipe based on ID' do
        repo = RecipeRepository.new

        recipe = repo.find(3)

        expect(recipe.name).to eq('Salad') # => 'Salad'
        expect(recipe.cooking_time).to eq('5') # => '5'
        expect(recipe.rating).to eq('1') # => '1'
    end
end