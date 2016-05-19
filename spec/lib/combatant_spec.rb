require 'spec_helper'

describe Combatant do

  let(:combatant) { Combatant.new('default_player', 6) }

  it "is an instance of Combatant" do
    expect(combatant).to be_instance_of(Combatant)
  end

  it "has a default speed of 4" do
    expect(combatant.speed).to eql(4)
  end

  it "can be initialized with a custom speed" do
    combatant_with_custom_speed = Combatant.new('default_player', 6, 1, 10)
    expect(combatant_with_custom_speed.speed).to eql(10)
  end

  context "combatant movement" do
    it "moves left" do
      expect{ combatant.move(:left) }.to change{ combatant.x }.by(combatant.speed * -1)
    end

    it "moves right" do
      expect{ combatant.move(:right) }.to change{ combatant.x }.by(combatant.speed)
    end

    it "moves up" do
      expect{ combatant.move(:up) }.to change{ combatant.y }.by(combatant.speed * -1)
    end

    it "moves down" do
      expect{ combatant.move(:down) }.to change{ combatant.y }.by(combatant.speed)
    end
  end

  context "#take_damage" do
    it "reduces combatant by 1 health by default" do
      expect{ combatant.take_damage }.to change{ combatant.health }.by(-1)
    end

    it "reduces combatant health by given amount" do
      expect{ combatant.take_damage(3) }.to change{ combatant.health }.by(-3)
    end
  end

  context "#heal_damage" do
    it "restores 1 health by default" do
      #must not be at max health
      combatant.take_damage

      expect{ combatant.heal_damage }.to change{ combatant.health }.by(1)
    end

    it "restores combatant health by a given amount" do
      #must not be at max health
      combatant.take_damage(3)

      expect{ combatant.heal_damage(2) }.to change{ combatant.health }.by(2)
    end

    it "has no effect if combatant is at max health" do
      expect{ combatant.heal_damage }.to change{ combatant.health }.by(0)
    end

    it "does not heal beyond max health" do
      #must not be at max health
      combatant.take_damage(3)

      expect{ combatant.heal_damage(4) }.to change{ combatant.health }.by(3)
    end
  end

  context "#alive?" do
    it "returns true if health is greater than 0" do
      expect(combatant.alive?).to eq(true)
    end

    it "returns false if health is lte to 0" do
      #kill the combatant
      combatant.take_damage(combatant.health)

      expect(combatant.alive?).to eq(false)
    end
  end

end
