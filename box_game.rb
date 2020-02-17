class BoxGame
  attr_accessor :match

  def initialize
    @match = nil
  end

  def start(input_file, output_file)
    read_input input_file
    @match.begin
    open(output_file, 'w') do |f|
      f.puts get_result
    end
  end

  def get_result
    result = ''
    win_army = @match.win_army
    army_general = win_army.army_general
    soldiers = win_army.soldiers
    result << "#{win_army.name[0,4] << " " << win_army.name[4, win_army.name.length-4]} Win\n"
    if !win_army.army_general.nil?
      result << "#{SoldierCategory::HASH_TYPE[army_general.class.name.to_sym]} #{army_general.m_code} #{army_general.m_attack} " <<
               "#{army_general.m_defend} #{SoldierCategory::Boolean::BOOL.key(army_general.m_equipment)} " <<
               "#{army_general.m_strength} #{army_general.m_experience}\n"
    elsif soldiers.length == 1
      soldier = soldiers.first
      result << "#{SoldierCategory::HASH_TYPE[soldier.class.name.to_sym]} #{soldier.m_code} #{soldier.m_attack} " <<
               "#{soldier.m_defend} #{SoldierCategory::Boolean::BOOL.key(soldier.m_equipment)} " <<
               "#{soldier.m_strength} #{soldier.m_experience}\n"
    end

    soldiers.each do |s|
      result << "#{SoldierCategory::HASH_TYPE[s.class.name.to_sym]} #{s.m_code} #{s.m_attack} " <<
               "#{s.m_defend} #{SoldierCategory::Boolean::BOOL.key(s.m_equipment)} #{s.m_strength}\n"
    end
    result
  end

  def read_input(input_file)
    teams = IO.readlines(input_file)
    end_first_team = teams[0].split(" ").last.to_i
    data_first_team = teams[0..end_first_team]
    data_second_team = teams[(end_first_team + 1)..teams.length - 1]
    first_army = init_army data_first_team
    second_army = init_army data_second_team
    @match = Match.new first_army, second_army
  end

  private

  def init_soldier(m_type, m_code, m_attack, m_defend, m_equipment, m_strength, m_experiment)
    if m_type == SoldierCategory::Type::ARMY_GENERAL
      ArmyGeneral.new m_code, m_attack, m_defend, m_equipment, m_strength, m_experiment
    elsif m_type == SoldierCategory::Type::VALIANT
      Valiant.new m_code, m_attack, m_defend, m_equipment, m_strength
    elsif m_type == SoldierCategory::Type::ARCHER
      Archer.new m_code, m_attack, m_defend, m_equipment, m_strength
    elsif m_type == SoldierCategory::Type::KNIGHT
      Knight.new m_code, m_attack, m_defend, m_equipment, m_strength
    end
  end

  def init_army(data_team)
    soldiers = []
    army_general = nil
    name_team = ''
    data_team.each do |line|
      data_line = line.split(" ")
      if data_line.first == 'Team'
        name_team = data_line.first << data_line[1]
      else
        m_type = data_line[0]
        m_code = data_line[1].to_s
        m_attack = data_line[2].to_f
        m_defend = data_line[3].to_f
        m_equipment = SoldierCategory::Boolean::BOOL[data_line[4].to_sym]
        m_strength = data_line[5].to_i
        soldier = init_soldier m_type, m_code, m_attack, m_defend,
                               m_equipment, m_strength, data_line[6].to_f
        if soldier.class == ArmyGeneral
          army_general = soldier
        else
          soldiers.push soldier
        end
      end
    end
    Army.new name_team, soldiers, army_general
  end
end