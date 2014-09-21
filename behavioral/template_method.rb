# Template Method Pattern
#
# Define the skeleton of an algorighm in an operation, deferring some steps to subclasses.
# Temlate Method lets subclasses redefine certain steps of an algorigthm without changing the algorightm's structure.

class Hero
  attr_reader :damage, :abilities

  # template method
  def initialize
    initialize_stats # hook

    @damage = damage_rating # hook
    @abilities = occupation_abilities # hook
  end

  def attack
    "Attacked dealing #{damage} damage"
  end

  # template method
  def greet
    greeting = ['Hello']
    greeting << unique_greeting_line # hook
    greeting
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

    def unique_greeting_line
      raise NotImplementedError
    end
end

class Warrior < Hero
  private
    def in itialize_stats
    end

    def damage_rating
      15
    end

    def occupation_abilities
      [:strike]
    end

    def unique_greeting_line
      'Warrior is ready to fight'
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
