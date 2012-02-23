Player.delete_all
Planet.delete_all
Building.delete_all
BuildingType.delete_all

BuildingType.create(:name => 'metal_mine')
BuildingType.create(:name => 'silicon_mine')
BuildingType.create(:name => 'plutonium_mine')

Player.create(:login => 'k41n', :password => 'qweasd')
