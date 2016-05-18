require 'spec_helper'

describe Player do

  let(:player) { Player.new('default_player', 6) }

  it "is an instance of Player" do
    expect(player).to be_instance_of(Player)
  end

  it "has a default speed of 4" do
    expect(player.speed).to eql(4)
  end

  it "can be initialized with a custom speed" do
    player_with_custom_speed = Player.new('default_player', 6, 1, 10)
    expect(player_with_custom_speed.speed).to eql(10)
  end

  context "player movement" do
    it "moves left" do
      expect{ player.move(:left) }.to change{ player.x }.by(player.speed * -1)
    end

    it "moves right" do
      expect{ player.move(:right) }.to change{ player.x }.by(player.speed)
    end

    it "moves up" do
      expect{ player.move(:up) }.to change{ player.y }.by(player.speed * -1)
    end

    it "moves down" do
      expect{ player.move(:down) }.to change{ player.y }.by(player.speed)
    end
  end

  context "#take_damage" do
    it "reduces player by 1 health by default" do
      expect{ player.take_damage }.to change{ player.health }.by(-1)
    end

    it "reduces player health by given amount" do
      expect{ player.take_damage(3) }.to change{ player.health }.by(-3)
    end
  end

  context "#heal_damage" do
    it "restores 1 health by default" do
      #must not be at max health
      player.take_damage

      expect{ player.heal_damage }.to change{ player.health }.by(1)
    end

    it "restores player health by a given amount" do
      #must not be at max health
      player.take_damage(3)

      expect{ player.heal_damage(2) }.to change{ player.health }.by(2)
    end

    it "has no effect if player is at max health" do
      expect{ player.heal_damage }.to change{ player.health }.by(0)
    end

    it "does not heal beyond max health" do
      #must not be at max health
      player.take_damage(3)

      expect{ player.heal_damage(4) }.to change{ player.health }.by(3)
    end
  end

  context "#alive?" do
    it "returns true if health is greater than 0" do
      expect(player.alive?).to eq(true)
    end

    it "returns false if health is lte to 0" do
      #kill the player
      player.take_damage(player.health)
      
      expect(player.alive?).to eq(false)
    end
  end

end
