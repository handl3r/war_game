module SoldierCategory
  HASH_TYPE = {ArmyGeneral: 'AG', Knight: 'K', Valiant: 'V', Archer: 'A' }
  module Type
    ARMY_GENERAL = 'AG'
    VALIANT = 'V'
    ARCHER = 'A'
    KNIGHT = 'K'

  end
  module Boolean
    BOOL = {:YES => true, :NO => false}
  end
  module Status
    DEAD = 0
    ALIVE = 1
  end
end