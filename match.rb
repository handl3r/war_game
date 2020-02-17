class Match
  attr_accessor :first_army, :second_army, :win_army

  def initialize(first_army, second_army)
    @first_army = first_army
    @second_army = second_army
    @win_army = nil
  end

  def begin
    @win_army = @first_army.attack @second_army
  end
end