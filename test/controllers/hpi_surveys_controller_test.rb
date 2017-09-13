require 'test_helper'

class HpiSurveysControllerTest < ActionController::TestCase
  setup do
    @hpi_survey = hpi_surveys(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hpi_surveys)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hpi_survey" do
    assert_difference('HpiSurvey.count') do
      post :create, hpi_survey: { email: @hpi_survey.email, hcode5: @hpi_survey.hcode5, q_01011: @hpi_survey.q_01011, q_01012: @hpi_survey.q_01012, q_01013: @hpi_survey.q_01013, q_01014: @hpi_survey.q_01014, q_01015: @hpi_survey.q_01015, q_01016: @hpi_survey.q_01016, q_01017: @hpi_survey.q_01017, q_01018: @hpi_survey.q_01018, q_01021: @hpi_survey.q_01021, q_01022: @hpi_survey.q_01022, q_01023: @hpi_survey.q_01023, q_01031: @hpi_survey.q_01031, q_01032: @hpi_survey.q_01032, q_01033: @hpi_survey.q_01033, q_01034: @hpi_survey.q_01034, q_01035: @hpi_survey.q_01035, q_01036: @hpi_survey.q_01036, q_01037: @hpi_survey.q_01037, q_0201: @hpi_survey.q_0201, q_0202: @hpi_survey.q_0202, q_0203: @hpi_survey.q_0203, q_0204: @hpi_survey.q_0204, q_0205: @hpi_survey.q_0205, q_0206: @hpi_survey.q_0206, q_0207: @hpi_survey.q_0207, q_0208: @hpi_survey.q_0208, q_0209: @hpi_survey.q_0209, q_0210: @hpi_survey.q_0210, q_0211: @hpi_survey.q_0211, q_0212: @hpi_survey.q_0212, q_0213: @hpi_survey.q_0213, q_0214: @hpi_survey.q_0214, q_0215: @hpi_survey.q_0215, q_0216: @hpi_survey.q_0216, q_0217: @hpi_survey.q_0217, q_0218: @hpi_survey.q_0218, q_0219: @hpi_survey.q_0219, q_0220: @hpi_survey.q_0220, q_0221: @hpi_survey.q_0221, q_0222: @hpi_survey.q_0222, q_0223: @hpi_survey.q_0223, q_0224: @hpi_survey.q_0224, q_0225: @hpi_survey.q_0225, q_0226: @hpi_survey.q_0226, q_0227: @hpi_survey.q_0227, user_id: @hpi_survey.user_id }
    end

    assert_redirected_to hpi_survey_path(assigns(:hpi_survey))
  end

  test "should show hpi_survey" do
    get :show, id: @hpi_survey
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @hpi_survey
    assert_response :success
  end

  test "should update hpi_survey" do
    patch :update, id: @hpi_survey, hpi_survey: { email: @hpi_survey.email, hcode5: @hpi_survey.hcode5, q_01011: @hpi_survey.q_01011, q_01012: @hpi_survey.q_01012, q_01013: @hpi_survey.q_01013, q_01014: @hpi_survey.q_01014, q_01015: @hpi_survey.q_01015, q_01016: @hpi_survey.q_01016, q_01017: @hpi_survey.q_01017, q_01018: @hpi_survey.q_01018, q_01021: @hpi_survey.q_01021, q_01022: @hpi_survey.q_01022, q_01023: @hpi_survey.q_01023, q_01031: @hpi_survey.q_01031, q_01032: @hpi_survey.q_01032, q_01033: @hpi_survey.q_01033, q_01034: @hpi_survey.q_01034, q_01035: @hpi_survey.q_01035, q_01036: @hpi_survey.q_01036, q_01037: @hpi_survey.q_01037, q_0201: @hpi_survey.q_0201, q_0202: @hpi_survey.q_0202, q_0203: @hpi_survey.q_0203, q_0204: @hpi_survey.q_0204, q_0205: @hpi_survey.q_0205, q_0206: @hpi_survey.q_0206, q_0207: @hpi_survey.q_0207, q_0208: @hpi_survey.q_0208, q_0209: @hpi_survey.q_0209, q_0210: @hpi_survey.q_0210, q_0211: @hpi_survey.q_0211, q_0212: @hpi_survey.q_0212, q_0213: @hpi_survey.q_0213, q_0214: @hpi_survey.q_0214, q_0215: @hpi_survey.q_0215, q_0216: @hpi_survey.q_0216, q_0217: @hpi_survey.q_0217, q_0218: @hpi_survey.q_0218, q_0219: @hpi_survey.q_0219, q_0220: @hpi_survey.q_0220, q_0221: @hpi_survey.q_0221, q_0222: @hpi_survey.q_0222, q_0223: @hpi_survey.q_0223, q_0224: @hpi_survey.q_0224, q_0225: @hpi_survey.q_0225, q_0226: @hpi_survey.q_0226, q_0227: @hpi_survey.q_0227, user_id: @hpi_survey.user_id }
    assert_redirected_to hpi_survey_path(assigns(:hpi_survey))
  end

  test "should destroy hpi_survey" do
    assert_difference('HpiSurvey.count', -1) do
      delete :destroy, id: @hpi_survey
    end

    assert_redirected_to hpi_surveys_path
  end
end
