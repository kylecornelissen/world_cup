require 'minitest/pride'
require 'minitest/autorun'
require './lib/player'
require './lib/team'
require './lib/world_cup'
require 'pry'

class WorldCupTest < Minitest::Test
  def setup
    @france = Team.new("France")
    @mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
    @pogba = Player.new({name: "Paul Pogba", position: "midfielder"})
    @france.add_player(@mbappe)
    @france.add_player(@pogba)
    @croatia = Team.new("Croatia")
    @modcic = Player.new({name: "Luka Modric", position: "midfielder"})
    @vida = Player.new({name: "Domagoj Vida", position: "defender"})
    @croatia.add_player(@modric)
    @croatia.add_player(@vida)
    @world_cup = WorldCup.new(2018, [@france, @croatia])
  end

  def test_if_it_exists
    assert_instance_of WorldCup, @world_cup
  end

  def test_if_initalized_variables_exist
    assert_equal 2018, @world_cup.year
    assert_equal [@france, @croatia], @world_cup.teams
  end

  def test_if_active_players_by_position_method_works
    assert_equal [@pogba, @modcic], @world_cup.active_players_by_position("midfielder")

    @croatia.eliminated = true


  end
end
