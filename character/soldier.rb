class Soldier
  DEAD = 0
  ALIVE = 1

  attr_accessor :m_code, :m_attack, :m_defend, :m_equipment, :m_strength, :m_status

  def initialize(m_code, m_attack, m_defend, m_equipment, m_strength)
    @m_code = m_code
    @m_attack = m_attack
    @m_defend = m_defend
    @m_equipment = m_equipment
    @m_strength = m_strength
    @m_status = SoldierCategory::Status::ALIVE
  end


  def fight(enemy_soldier)
    if self.stronger_than? enemy_soldier
      self.weaken_by_enemy
      enemy_soldier.die
      self
    else
      enemy_soldier.weaken_by_enemy
      self.die
      enemy_soldier
    end
  end

  def is_dead?
    if m_status == SoldierCategory::Status::DEAD
      true
    else
      false
    end
  end

  def weaken_by_enemy
    @m_attack -= 20
    @m_defend -= 20
  end

  def die
    @m_status = SoldierCategory::Status::DEAD
  end

  private

  def is_equip?
    m_equipment
  end

  def stronger_than?(enemy_soldier)
    if m_defend > enemy_soldier.m_attack and m_attack >= enemy_soldier.m_defend
      true
    elsif m_defend <= enemy_soldier.m_attack && m_attack < enemy_soldier.m_defend
      false
    elsif m_strength > enemy_soldier.m_strength
      true
    elsif m_strength < enemy_soldier.m_strength
      false
    else
      puts "--BAD INPUT"
      exit
    end
  end

end