require "test_helper"

class NiversControllerTest < ActionDispatch::IntegrationTest
  setup do
    @niver = nivers(:one)
  end

  test "should get index" do
    get nivers_url
    assert_response :success
  end

  test "should get new" do
    get new_niver_url
    assert_response :success
  end

  test "should create niver" do
    assert_difference("Niver.count") do
      post nivers_url, params: { niver: { data_de_nascimento: @niver.data_de_nascimento, nome: @niver.nome } }
    end

    assert_redirected_to niver_url(Niver.last)
  end

  test "should show niver" do
    get niver_url(@niver)
    assert_response :success
  end

  test "should get edit" do
    get edit_niver_url(@niver)
    assert_response :success
  end

  test "should update niver" do
    patch niver_url(@niver), params: { niver: { data_de_nascimento: @niver.data_de_nascimento, nome: @niver.nome } }
    assert_redirected_to niver_url(@niver)
  end

  test "should destroy niver" do
    assert_difference("Niver.count", -1) do
      delete niver_url(@niver)
    end

    assert_redirected_to nivers_url
  end
end
