require 'spec_helper'
require_relative '../../lib/game'

describe Game do
  it "is an instance of Gosu::Window" do
    expect(Game.new(8, 8, false)).to be_instance_of(Game)
  end
end