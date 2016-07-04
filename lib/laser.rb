class Laser < Weapon
  attr_reader :range
  def initialize 
    #takes nothing else in its initialize
    super('Laser', 125, 25)
    @range = 1
  end
end