  class Hero
    attr_reader :health, :strength, :stealth

    def initialize(health, strength, stealth)
      @health = health
      @strength = strength
      @stealth = stealth
      @fled = false
    end

    def fled?
      @fled
    end

    def flee(monster)
      dice = []
      strength.times { dice << 1 + rand(6) }
      successes = dice.count { |die| die > 4}
      if successes >= monster.notice
        @fled = true
      end
    end

    def attack(monster)
      dice = []
      strength.times { dice << 1 + rand(6) }
      successes = dice.count { |die| die > 4}
      if successes >= monster.toughness
        return true
      else
        @health -= monster.damage
        return false
      end
    end

    def dead?
      @health <= 0
    end

  end

  class Monster
    attr_reader :toughness, :damage, :notice

    def initialize(toughness, damage, notice)
      @toughness = toughness
      @damage = damage
      @notice = notice
    end
  end

  def bar
    puts "=-" * 40
  end

  hero = Hero.new 10, 3, 2
  monster = Monster.new 3, 2, 2

  until hero.attack(monster) || hero.dead? || hero.fled?
    puts "You fail miserably in attacking. The monster make you spit #{monster.damage} blood drops"
    puts "Your current health is #{hero.health}"
    puts "Understanding your minimal abilities, you try to escape..."
    hero.flee(monster)
  end

  bar

  if hero.dead?
    puts "Here we can see your limbs laying on the ground."
  elsif hero.fled?
    puts "Taking advantage of the monster's lack of attention, you survived another day."
  else
    puts "The monster's lucky vanished when your last rush concludes his life."
  end

  bar
