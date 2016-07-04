class Robot 
  HIT_POINTS = 20
   attr_reader :position, :items, :items_weight, :health
   attr_accessor :equipped_weapon

  def initialize
     @position = [0,0]
     @items = []
     @health = 100
     @equipped_weapon = nil
  end
  
  def move_left
    @position[0] -= 1
  end

  def move_right
    @position[0] += 1
  end

  def move_up
    @position[1] += 1
  end

  def move_down
    @position[1] -= 1
  end

  

  def pick_up(item)
    if
      items_weight + item.weight <= 250
      @items << item
    end
    if item.is_a? Weapon
      @equipped_weapon = item
    end
    if (item.is_a? BoxOfBolts) && (health <= 80)
      item.feed(self)
    end
  end
  #if expression has a value of whatever gets evaluated in the if branch or else branch

  

  def items_weight
    @items.inject(0) do |weight, item|
      weight + item.weight
    end 
  end

  def wound(damage)
    #if @health - amount < 0
    #@health = 0
    #else 
    #@health = @health - amount
    #end 

    #set @health to (@health - amount) or 0, whichever is higher
    #ser @health to the max of (@health - amunt)a ns 0
    @health = [0, (@health-damage)].max 
  end

  def heal(damage)
    @health = [100,(@health+damage)].min #can use constant for max health 
  end
  #make simpler methods (more specificity)
  def attack(enemy)
    if self.range_for_attack?(enemy)
      if equipped_weapon !=nil
       equipped_weapon.hit(enemy) 
      else
        enemy.wound(HIT_POINTS)
      end
    elsif self.range_for_attack_with_grenade?(enemy)
      if equipped_weapon.is_a? Grenade
        equipped_weapon.hit(enemy)
        @equipped_weapon = nil
      end
    end
  end

  def range_for_attack?(enemy)
    if self.position[0] == enemy.position[0]
      r = self.position[1] - enemy.position[1]
      if r.abs <= 1
        true
      end
    elsif self.position[1] == enemy.position[1]
      s = self.position[0] - enemy.position[0]
      if s.abs <= 1
        true
      end
    else
      false
    end
  end

  def range_for_attack_with_grenade?(enemy)
    if self.position[0] == enemy.position[0]
      r = self.position[1] - enemy.position[1]
      if r.abs <= 2
        true
      end
    elsif self.position[1] == enemy.position[1]
      s = self.position[0] - enemy.position[0]
      if s.abs <= 2
        true
      end
    else
      false
    end
  end
  def heal!
    if health <= 0
      raise ArgumentError 'robot cannot be revived'
    end
  end
end




#     if equipped_weapon !=nil
#        equipped_weapon.hit(enemy)
#     end
     
#        equipped_weapon.hit(enemy)

#      else 
#      #.is_a? Weapon
#      #making default number 20 (can wound without weapon)
       
#         enemy.wound(20)
#     #default attakc numner, can make constant 
  
#     end
#   end 
# end   #the rspec is using stubs to describe it

