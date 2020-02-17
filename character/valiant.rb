class Valiant < Soldier

  def initialize(m_code, m_attack, m_defend, m_equipment, m_strength)
    super m_code, m_attack, m_defend, m_equipment, m_strength
    strengthening_by_equipment if is_equip?
  end

  def strengthening_by_equipment
    @m_attack *= 2
  end
end