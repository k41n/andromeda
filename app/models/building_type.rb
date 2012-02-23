class BuildingType < ActiveRecord::Base
  def update_planet_incomes(planet,level)
    if name == "metal_mine"
      planet.update_attribute(:metal_income,10+20*level)
    end
  end
end
