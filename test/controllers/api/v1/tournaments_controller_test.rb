require "test_helper"

class Api::V1::TournamentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tournament = tournaments(:one)
  end

  test "should get index" do
    get tournaments_url, as: :json
    assert_response :success
  end

  test "should create tournament" do
    assert_difference('Api::V1::Tournament.count') do
      post tournaments_url, params: { tournament: { city: @tournament.city, name: @tournament.name, start_date: @tournament.start_date, state: @tournament.state } }, as: :json
    end

    assert_response 201
  end

  test "should show tournament" do
    get tournament_url(@tournament), as: :json
    assert_response :success
  end

  test "should update tournament" do
    patch tournament_url(@tournament), params: { tournament: { city: @tournament.city, name: @tournament.name, start_date: @tournament.start_date, state: @tournament.state } }, as: :json
    assert_response 200
  end

  test "should destroy tournament" do
    assert_difference('Api::V1::Tournament.count', -1) do
      delete tournament_url(@tournament), as: :json
    end

    assert_response 204
  end
end
