# Put your code here to make the tests pass

class Weapon
  attr_reader :name, :damage
  
  def initialize(name="Name", damage)
    @name=name
    @damage=damage
  end

end

class BattleBot
  attr_reader :name, :health, :weapon, :enemies

  def initialize( name = "Name",
                  health = 100,
                  weapon = nil,
                  enemies = [])
    @name = name
    @health = health
    @weapon = weapon 
    @enemies = enemies
  end

  def dead?
    health == 0 ? true : false
  end

  def pick_up(weapon)
     @weapon=weapon if @weapon.nil?
  end

  def drop_weapon
    @weapon=nil
  end

  def attack(bot2)
    raise "No weapon" if @weapon == nil
    raise ArgumentError unless bot2.class == BattleBot
    bot2.enemies_count(self)
    bot2.take_damage(weapon.damage)
    bot2.dead?
    
  end

  def take_damage(damage)
    @health-=damage
  end

  def enemies
     @enemies
  end

  def enemies_count(bot)
    
      @enemies << bot unless @enemies.include? (bot)
    
  end 

  

end