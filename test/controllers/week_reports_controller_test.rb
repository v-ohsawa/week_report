require 'test_helper'

class WeekReportsControllerTest < ActionController::TestCase
  setup do
    @week_report = week_reports(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:week_reports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create week_report" do
    assert_difference('WeekReport.count') do
      post :create, week_report: { done: @week_report.done, next: @week_report.next, project_id: @week_report.project_id, start_day: @week_report.start_day, understood: @week_report.understood, user_id: @week_report.user_id }
    end

    assert_redirected_to week_report_path(assigns(:week_report))
  end

  test "should show week_report" do
    get :show, id: @week_report
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @week_report
    assert_response :success
  end

  test "should update week_report" do
    patch :update, id: @week_report, week_report: { done: @week_report.done, next: @week_report.next, project_id: @week_report.project_id, start_day: @week_report.start_day, understood: @week_report.understood, user_id: @week_report.user_id }
    assert_redirected_to week_report_path(assigns(:week_report))
  end

  test "should destroy week_report" do
    assert_difference('WeekReport.count', -1) do
      delete :destroy, id: @week_report
    end

    assert_redirected_to week_reports_path
  end
end
