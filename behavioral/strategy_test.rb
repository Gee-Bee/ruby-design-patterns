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

  class PrintingCharacterStatsTest < MiniTest::Test
    def setup
      @hero = ::Hero.new ::BattleStats.new
    end

    def test_battle_stats_printingn
      assert_equal "Damage: 10\nHealth: 5", @hero.print_stats
    end

    def test_skills_priting
      @hero.printer = ::SkillsStats.new
      assert_equal "Stealth\nDriving\nIntimidation\n", @hero.print_stats
    end
  end
end
