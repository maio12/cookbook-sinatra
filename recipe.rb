class Recipe
    attr_reader :name, :description, :time, :difficulty
    attr_accessor :done
    def initialize(name, description, time = (), difficulty = (), done = ())
      @name = name
      @time = time || 0
      @description = description
      @difficulty = difficulty || "no info"
      @done = '[ ]' || "no info"
    end
  
    def mark_as_done
      @done = '[X]'
    end
end