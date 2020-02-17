class ArmyGeneral < Soldier
  VERY_LOW = 0.5
  LOW = 0.8
  MEDIUM = 1.5
  HIGH = 2.0

  attr_accessor :m_experience

  def initialize(m_code, m_attack, m_defend, m_equipment, m_strength, m_experience)
    super m_code, m_attack, m_defend, m_equipment, m_strength
    @m_experience = m_experience
  end

  def get_buff_coe  #coefficient
    if @m_experience == 0
      VERY_LOW
    elsif @m_experience > 0 and @m_experience <= 2
      LOW
    elsif @m_experience > 2 and @m_experience <= 5
      MEDIUM
    elsif @m_experience > 5
      HIGH
    else
      puts "--BAD INPUT"
      exit
    end
  end
end

