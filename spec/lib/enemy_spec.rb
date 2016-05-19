require 'spec_helper'

describe Enemy do

  let(:enemy) { Enemy.new('dead', 2) }

  it 'is an instance of Enemy' do
    expect(enemy).to be_instance_of(Enemy)
  end

  it 'has a default max health of 2' do
    expect(enemy.health).to eql(2)
  end

  it 'moves towards the Player' do
    player = Player.new('default_player', 6)

    expect(enemy.x).to change_by(-1)
  end

end