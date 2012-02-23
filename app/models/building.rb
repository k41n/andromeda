class Building < ActiveRecord::Base
  belongs_to :building_type
  belongs_to :planet

  delegate :name, :to=>:building_type, :prefix => false

  def next_level
    level + 1
  end

  def next_level_metal
    next_level * 100
  end

  def next_level_silicon
    next_level * 50
  end

  def next_level_plutonium
    next_level * 5
  end

  def next_level_money
    next_level * 10
  end

  def next_level_time
    next_level * 60
  end

  def begin_upgrade
    update_attribute(:upgrading_until, next_level_time.from_now)
    planet.update_attributes(
        :metal => planet.metal - next_level_metal,
        :silicon => planet.silicon - next_level_silicon,
        :plutonium => planet.plutonium - next_level_plutonium
    )
    planet.player.update_attributes(
        :money => planet.player.money - next_level_money
    )
  end

  def upgrade
    update_attributes(
        :level => level + 1,
        :upgrading_until => nil
    )
    building_type.update_planet_incomes(planet, level)
  end
end
