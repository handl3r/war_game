class Army
  attr_accessor :name, :soldiers, :army_general

  def initialize(name, soldiers, army_general)
    @name = name
    @soldiers = soldiers
    @army_general = army_general
    effect_to_army unless army_general.nil?
  end

  def attack(enemy_army)
    while !self.soldiers.empty? and !enemy_army.soldiers.empty? #and
      # first_army.has_army_general? and second_army.has_army_general?
      soldier = self.soldiers.first
      enemy = enemy_army.soldiers.first
      soldier.fight enemy
      if soldier.is_dead?
        self.soldiers.shift
      else
        enemy_army.soldiers.shift
      end
      if self.soldiers.empty? and self.has_army_general?
        self.soldiers.push self.army_general
        self.army_general = nil
      elsif enemy_army.soldiers.empty? and enemy_army.has_army_general?
        enemy_army.soldiers.push enemy_army.army_general
        enemy_army.army_general = nil
      end
    end
    if self.soldiers.empty?
      enemy_army
    else
      self
    end
  end

  def has_army_general?
    !army_general.nil?
  end

  private

  def effect_to_army
    buff_coe = army_general.get_buff_coe
    @soldiers.each do |soldier|
      soldier.m_attack *= buff_coe
      soldier.m_defend *= buff_coe
    end
  end



end