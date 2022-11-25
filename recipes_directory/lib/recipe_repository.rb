require_relative 'recipe'

class RecipeRepository
    def all
        sql = 'SELECT id, name, cooking_time, rating FROM recipes;'
        results = DatabaseConnection.exec_params(sql, [])
        recipe_storage = []
        results.each do |rec|
            recipe = Recipe.new
            recipe.id = rec['id']
            recipe.name = rec['name']
            recipe.cooking_time = rec['cooking_time']
            recipe.rating = rec['rating']
            recipe_storage << recipe
        end
        return recipe_storage
    end

    def find(id)
        sql = 'SELECT id, name, cooking_time, rating FROM recipes WHERE id = $1;'
        sql_params = [id]
        results = DatabaseConnection.exec_params(sql, sql_params)

        record = results[0]

        recipe = Recipe.new
        recipe.id = record['id']
        recipe.name = record['name']
        recipe.cooking_time = record['cooking_time']
        recipe.rating = record['rating']
        return recipe
    end
end