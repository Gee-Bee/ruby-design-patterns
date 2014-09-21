class Hero
  attr_reader :damage, :abilities

  def initialize occupation = nil
    case occupation
    when :warrior
      @damage = 15
      @abilities = [:strike]
    when :mage
      @damage = 7
      @abilities = [:magic_arrow]
    else
      @damage = 10
      @abilities = []
    end
  end

  def attack
    "Attacked dealing #{damage} damage"
  end
end
