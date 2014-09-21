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
      @hero = Warrior.new
    end

    def test_default_damage_rating
      assert_equal 15, @hero.damage
    end

    def test_special_abilities
      assert @hero.abilities.include?(:strike)
    end
  end

  class MageTest < MiniTest::Test
    def setup
      @hero = Mage.new
    end

    def test_default_damage_rating
      assert_equal 7, @hero.damage
    end

    def test_special_abilities
      assert @hero.abilities.include?(:magic_arrow)
    end
  end
end
