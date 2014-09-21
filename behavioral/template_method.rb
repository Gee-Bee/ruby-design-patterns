class Hero
  attr_reader :damage, :abilities

  def initialize
    initialize_stats

    @damage = damage_rating
    @abilities = occupation_abilities
  end

  def attack
    "Attacked dealing #{damage} damage"
  end

  private
    def initialize_stats
    end

    def damage_rating
      10
    end

    def occupation_abilities
      []
    end
end

class Warrior < Hero
  private
    def initialize_stats
    end

    def damage_rating
      15
    end

    def occupation_abilities
      [:strike]
    end
end

class Mage < Hero
  private
    def initialze_stats
    end

    def damage_rating
      7
    end

    def occupation_abilities
      [:magic_arrow]
    end
end
