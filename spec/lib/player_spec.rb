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
end