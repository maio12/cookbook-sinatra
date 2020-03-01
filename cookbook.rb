require 'csv'

class Cookbook
  # loads existing Recipe from the CSV
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @recipes = []
    csv_read
  end

  # returns all the recipes
  def all
    @recipes
  end

  # adds a new recipe to the cookbook
  def add_recipe(recipe)
    @recipes << recipe
    csv_write
  end

  # removes a recipe from the cookbook
  def remove_recipe(recipe_index)
    @recipes.delete_at(recipe_index)
    csv_write
  end


  def csv_write
    # csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }
    CSV.open(@csv_file_path, 'wb') do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description, recipe.time, recipe.difficulty, recipe.done]
      end
    end
  end

  def csv_read
    CSV.foreach(@csv_file_path) do |row|
      @recipes << Recipe.new(row[0], row[1], row[2], row[3], row[4])
    end
  end
end