require 'minitest/pride'
require 'minitest/autorun'
require './lib/player'
require './lib/team'
require 'pry'

class TeamTest < Minitest::Test
  def setup
    @team = Team.new("France")
    @mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
    @pogba = Player.new({name: "Paul Pogba", position: "midfielder"})
  end

  def test_if_team_class_exists
    assert_instance_of Team, @team
  end

  def test_if_country_attribute_exists
    assert_equal "France", @team.country
  end

  def test_if_team_is_not_eliminated
    refute @team.eliminated?
  end


  def test_if_team_is_eliminated
    @team.eliminated = true

    assert @team.eliminated?
  end

  def test_if_players_array_initializes_empty
    assert_equal [], @team.players
  end

  def test_if_player_objects_added_to_players_array
    @team.add_player(@mbappe)
    @team.add_player(@pogba)

    assert_equal [@mbappe, @pogba], @team.players
  end

  def test_if_players_separated_by_position
    @team.add_player(@mbappe)
    @team.add_player(@pogba)

    assert_equal [@pogba], @team.players_by_position("midfielder")
    assert_equal [], @team.players_by_position("defender")
  end

end
