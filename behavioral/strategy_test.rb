require 'minitest/autorun'
require_relative 'strategy'

class HeroTest < MiniTest::Test
  def setup
    @hero = ::Hero.new ::BattleStats.new
  end

  def test_damage
    assert_equal 10, @hero.damage
  end

  def test_health
    assert_equal 5, @hero.health
  end

  def test_skills
    assert @hero.skills.include? :stealth
    assert @hero.skills.include? :driving
    assert @hero.skills.include? :intimidation
  end
end

class PrintingCharacterStatsTest < MiniTest::Test
  def setup
    @hero = ::Hero.new ::BattleStats.new
  end

  def test_battle_stats_printing
    assert_equal "<html>Damage: 10\nHealth: 5</html>", @hero.print_stats
  end

  def test_skills_priting
    @hero.printer = ::SkillsStats.new
    assert_equal "<html>Stealth\nDriving\nIntimidation\n</html>", @hero.print_stats
  end

  def test_custom_ad_hoc_printer
    assert_equal "Damage: 10\nNumber of skills: 3", (@hero.print_stats do   |damage, health, skills|
      "Damage: #{damage}\nNumber of skills: #{skills.size}"
    end)
  end
end

class StrategyContractTest < MiniTest::Test
  def test_sending_print_message_to_printer_by_hero
    printer = Minitest::Mock.new
    hero = ::Hero.new printer
    printer.expect(:print, 'printing...', [hero.damage, hero.health, hero.skills])
    hero.print_stats
    printer.verify
  end

  def test_responding_to_print_message_by_printers
    assert BattleStats.new.respond_to?(:print)
    assert SkillsStats.new.respond_to?(:print)
  end
end
