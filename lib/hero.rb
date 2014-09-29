class Hero
  attr_reader :strength, :health

  def initialize(p = {})
    @strength = p.fetch(:strength, 3)
    @health = p.fetch(:health, 10)
  end
end
