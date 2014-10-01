# Strategy Pattern
#
# Define a family of algorithms, encapsulate each one and make them interchangeable.
# Strategy lets the algorigthm vary independently from clients that use it.

class Hero
  attr_reader :damage, :health, :skills
  attr_accessor :printer

  def initialize printer
    @damage = 10
    @health = 5
    @skills = [:stealth, :driving, :intimidation]
    @printer = printer
  end

  def print_stats
    if block_given?
      yield(damage, health, skills)
    else
      printer.print damage, health, skills
    end
  end
end

module HTMLPrinter
  # template method
  def print damage, health, skills
    result = header
    result += content(damage, health, skills)
    result += footer
  end
  private
    def header
      '<html>'
    end

    def content damage, health, skills
      raise NotImplementedError
    end

    def footer
      '</html>'
    end
end

class BattleStats
  include HTMLPrinter
  private
    def content damage, health, skills
      "Damage: #{damage}\nHealth: #{health}"
    end
end

class SkillsStats
  include HTMLPrinter
  private
    def content damage, health, skills
      skills.inject('') {|result,skill| result + skill.to_s.capitalize + "\n"}
    end
end
