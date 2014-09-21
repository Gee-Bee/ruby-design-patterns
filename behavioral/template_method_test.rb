require 'minitest/autorun'
require_relative 'template_method'

module TemplateMethodTest
  class HeroTest < MiniTest::Test
    def setup
      @hero = Hero.new
    end

    def test_default_damage_rating
      assert_equal 10, @hero.damage
    end

    def test_attack_ability
      assert_equal 'Attacked dealing 10 damage', @hero.attack
    end
  end

  class WarriorTest < MiniTest::Test
    def setup
      @hero = Hero.new :warrior
    end

    def test_default_damage_rating
      assert_equal 15, @hero.damage
    end
  end
end
