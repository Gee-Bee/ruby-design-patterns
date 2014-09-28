require 'minitest/autorun'
require_relative 'strategy'

class HeroTest < MiniTest::Test
  def setup
    @hero = ::Hero.new
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
      @hero = ::Hero.new
    end

    def test_battle_stats_printing_by_default
      assert_equal "Damage: 10\nHealth: 5", @hero.print_stats
    end
  end
end