require 'test_helper'

class AdminsControllerTest < ActionController::TestCase
  setup do
    @admin = admins(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admins)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin" do
    assert_difference('Admin.count') do
      post :create, admin: { address: @admin.address, administration: @admin.administration, ccaatt: @admin.ccaatt, department: @admin.department, division: @admin.division, email: @admin.email, fname: @admin.fname, hcode5: @admin.hcode5, hcode9: @admin.hcode9, latitude: @admin.latitude, lname: @admin.lname, longitude: @admin.longitude, mobile: @admin.mobile, offname: @admin.offname, offtype: @admin.offtype, pak: @admin.pak, person1: @admin.person1, person2: @admin.person2, person3: @admin.person3, person4: @admin.person4, person5: @admin.person5, personall: @admin.personall, province: @admin.province, region: @admin.region, username: @admin.username }
    end

    assert_redirected_to admin_path(assigns(:admin))
  end

  test "should show admin" do
    get :show, id: @admin
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin
    assert_response :success
  end

  test "should update admin" do
    patch :update, id: @admin, admin: { address: @admin.address, administration: @admin.administration, ccaatt: @admin.ccaatt, department: @admin.department, division: @admin.division, email: @admin.email, fname: @admin.fname, hcode5: @admin.hcode5, hcode9: @admin.hcode9, latitude: @admin.latitude, lname: @admin.lname, longitude: @admin.longitude, mobile: @admin.mobile, offname: @admin.offname, offtype: @admin.offtype, pak: @admin.pak, person1: @admin.person1, person2: @admin.person2, person3: @admin.person3, person4: @admin.person4, person5: @admin.person5, personall: @admin.personall, province: @admin.province, region: @admin.region, username: @admin.username }
    assert_redirected_to admin_path(assigns(:admin))
  end

  test "should destroy admin" do
    assert_difference('Admin.count', -1) do
      delete :destroy, id: @admin
    end

    assert_redirected_to admins_path
  end
end
