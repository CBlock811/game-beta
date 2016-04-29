require 'spec_helper'
require_relative '../../lib/player'

describe Player do

  let(:player) { Player.new }

  it "is an instance of Player" do
    expect(player).to be_instance_of(Player)
  end

  it "has a default speed of 3" do
    expect(player.speed).to eql(3)
  end

  it "can be initialized with a custom speed" do
    player_with_custom_speed = Player.new(10)
    expect(player_with_custom_speed.speed).to eql(10)
  end

  context "player movement" do
    it "moves left" do
      expect{player.move(:left)}.to change{player.x}.by(player.speed * -1)
    end

    it "moves right" do
      expect{player.move(:right)}.to change{player.x}.by(player.speed)
    end

    it "moves up" do
      expect{player.move(:up)}.to change{player.y}.by(player.speed * -1)
    end

    it "moves down" do
      expect{player.move(:down)}.to change{player.y}.by(player.speed)
    end
  end

end