# O it 'vazio' aparece nos testes como 'não implementado (pending)', mas não falha

require 'spec_helper'
require_relative '../../lib/hero'

describe Hero do
  let(:hero) { Hero.new}

  describe "default attributes" do


    it "has default health equal to 10" do
      expect(hero.health).to eq(10)
    end
    it "has default strength equal to 3" do
      expect(hero.strength).to eq(3)
    end
    it "has default gold equal to 0" do
      expect(hero.gold).to eq(0)
    end
    it "has default exp equal to 0" do
      expect(hero.exp).to eq(0)
    end
  end

  it "can be damaged" do
    hero.damage(3)
    hero.damage(2)
    expect(hero.health).to eq(5)
  end

  it "gains gold" do
    hero.gain_gold(3)
    hero.gain_gold(4)
    expect(hero.gold).to eq(7)
  end

  it "gains exp" do
    hero.gain_exp(100)
    hero.gain_exp(150)
    expect(hero.exp).to eq(250)
  end

  it "can be initialized with custom health" do
    hero = Hero.new health: 10
    expect(hero.health).to eq(10)
  end

  it "can be initialized with custom strength" do
    hero = Hero.new strengh: 3
    expect(hero.strength).to eq(3)
  end

  describe "attack attack" do
    let(:attack_action) { double("attack_action") }

    let(:hero) { Hero.new actions: { attack: attack_action} }

    it "has attack action" do
      expect(hero.actions[:attack]).to eq(attack_action)
    end

    it "activates attack action" do
      monster = double("monster")
      attack_action.should_receive(:activate)
      hero.activate_action :attack, monster
    end
  end
end

