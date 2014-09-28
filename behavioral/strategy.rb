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
    printer.print self
  end
end

class BattleStats
  def print context
    "Damage: #{context.damage}\nHealth: #{context.health}"
  end
end

class SkillsStats
  def print context
    context.skills.inject('') {|result,skill| result + skill.to_s.capitalize + "\n"}
  end
end
