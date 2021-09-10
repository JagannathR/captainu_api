require "test_helper"

class Api::V1::AssessmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @assessment = assessments(:one)
  end

  test "should get index" do
    get assessments_url, as: :json
    assert_response :success
  end

  test "should create assessment" do
    assert_difference('Api::V1::Assessment.count') do
      post assessments_url, params: { assessment: { player_id: @assessment.player_id, tournament_id: @assessment.tournament_id, user_id: @assessment.user_id, assessment_type: @assessment.assessment_type, rating: @assessment.rating } }, as: :json
    end

    assert_response 201
  end

  test "should show assessment" do
    get assessment_url(@assessment), as: :json
    assert_response :success
  end

  test "should update assessment" do
    patch assessment_url(@assessment), params: { assessment: { player_id: @assessment.player_id, tournament_id: @assessment.tournament_id, user_id: @assessment.user_id, assessment_type: @assessment.assessment_type, rating: @assessment.rating } }, as: :json
    assert_response 200
  end

  test "should destroy assessment" do
    assert_difference('Api::V1::Assessment.count', -1) do
      delete assessment_url(@assessment), as: :json
    end

    assert_response 204
  end
end
