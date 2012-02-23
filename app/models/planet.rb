class Planet < ActiveRecord::Base
  belongs_to :player
  has_many :buildings

  scope :visible_in, lambda{|left, top, right, bottom| where(['x>? AND x<? AND y<? AND y>?',left,right,bottom,top])}

  before_create :init_resources
  after_create :create_buildings

private
  def init_resources
    self.plutonium = 100
    self.metal = 500
    self.silicon = 500
    self.population = 7000 #7 billions
    self.metal_income = 100
    self.silicon_income = 10
    self.metal_income = 10
    self.population_income = 10
    self.plutonium_income = 2
  end

  def create_buildings
    self.buildings.create(:building_type => BuildingType.find_by_name("metal_mine"))
    self.buildings.create(:building_type => BuildingType.find_by_name("silicon_mine"))
    self.buildings.create(:building_type => BuildingType.find_by_name("plutonium_mine"))
  end
end
