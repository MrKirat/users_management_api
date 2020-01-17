require 'test_helper'

class Api::V1::EmployeesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_employee = api_v1_employees(:one)
  end

  test "should get index" do
    get api_v1_employees_url, as: :json
    assert_response :success
  end

  test "should create api_v1_employee" do
    assert_difference('Api::V1::Employee.count') do
      post api_v1_employees_url, params: { api_v1_employee: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show api_v1_employee" do
    get api_v1_employee_url(@api_v1_employee), as: :json
    assert_response :success
  end

  test "should update api_v1_employee" do
    patch api_v1_employee_url(@api_v1_employee), params: { api_v1_employee: {  } }, as: :json
    assert_response 200
  end

  test "should destroy api_v1_employee" do
    assert_difference('Api::V1::Employee.count', -1) do
      delete api_v1_employee_url(@api_v1_employee), as: :json
    end

    assert_response 204
  end
end
