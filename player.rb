
class Player
attr_reader :name, :health
  def initialize(name)
    @name = name
    @health = 3
  end

def dead?
  @health <= 0
end

def wrong_answer
  @health -= 1
end

def summary
    "#{name}"
  end


end
