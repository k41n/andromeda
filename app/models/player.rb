class Player < ActiveRecord::Base
  validates_confirmation_of :password

  after_create :initialize_colony

  has_many :planets

  def update_resources
    hours_passed = (Time.zone.now - updated_at)/3600
    total_population = planets.inject(0){|sum,x| sum + x.population}
    update_attributes(
        :money => money + total_population * 0.13 * hours_passed / 1000
    )
    planets.each do |planet|
      hours_passed = (Time.zone.now - planet.updated_at)/3600
      planet.update_attributes(
          :metal => planet.metal + planet.metal_income * hours_passed,
          :silicon => planet.silicon + planet.silicon_income * hours_passed,
          :plutonium => planet.plutonium + planet.plutonium_income * hours_passed,
          :population => planet.population + planet.population_income * hours_passed
      )
    end
    self.delay(:run_at => 10.seconds.from_now).update_resources
  end

private
  def initialize_colony
    planets.create(name: I18n.t(:first_colony), x: rand(1000), y: rand(1000))
    update_attribute(:money, 100)
  end
end
