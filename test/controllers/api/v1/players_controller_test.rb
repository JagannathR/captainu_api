require "test_helper"

class Api::V1::PlayersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_player = api_v1_players(:one)
  end

  test "should get index" do
    get api_v1_players_url, as: :json
    assert_response :success
  end

  test "should create api_v1_player" do
    assert_difference('Api::V1::Player.count') do
      post api_v1_players_url, params: { api_v1_player: { birthday: @api_v1_player.birthday, first_name: @api_v1_player.first_name, graduation_year: @api_v1_player.graduation_year, height: @api_v1_player.height, last_name: @api_v1_player.last_name, position: @api_v1_player.position, recruit: @api_v1_player.recruit, weight: @api_v1_player.weight } }, as: :json
    end

    assert_response 201
  end

  test "should show api_v1_player" do
    get api_v1_player_url(@api_v1_player), as: :json
    assert_response :success
  end

  test "should update api_v1_player" do
    patch api_v1_player_url(@api_v1_player), params: { api_v1_player: { birthday: @api_v1_player.birthday, first_name: @api_v1_player.first_name, graduation_year: @api_v1_player.graduation_year, height: @api_v1_player.height, last_name: @api_v1_player.last_name, position: @api_v1_player.position, recruit: @api_v1_player.recruit, weight: @api_v1_player.weight } }, as: :json
    assert_response 200
  end

  test "should destroy api_v1_player" do
    assert_difference('Api::V1::Player.count', -1) do
      delete api_v1_player_url(@api_v1_player), as: :json
    end

    assert_response 204
  end
end
