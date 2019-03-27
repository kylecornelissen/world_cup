require 'minitest/pride'
require 'minitest/autorun'
require './lib/player'
require 'pry'

class PlayerTest < Minitest::Test

  def setup
    @player = Player.new({name: "Luka Modric", position: "midfielder"})
  end

  def test_if_it_exists
    assert_instance_of Player, @player
  end

  def test_if_player_info_attributes_exist
    assert_equal "Luka Modric", @player.name
    assert_equal "midfielder", @player.position
  end
end
