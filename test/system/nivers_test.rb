require "application_system_test_case"

class NiversTest < ApplicationSystemTestCase
  setup do
    @niver = nivers(:one)
  end

  test "visiting the index" do
    visit nivers_url
    assert_selector "h1", text: "Nivers"
  end

  test "should create niver" do
    visit nivers_url
    click_on "New niver"

    fill_in "Data de nascimento", with: @niver.data_de_nascimento
    fill_in "Nome", with: @niver.nome
    click_on "Create Niver"

    assert_text "Niver was successfully created"
    click_on "Back"
  end

  test "should update Niver" do
    visit niver_url(@niver)
    click_on "Edit this niver", match: :first

    fill_in "Data de nascimento", with: @niver.data_de_nascimento
    fill_in "Nome", with: @niver.nome
    click_on "Update Niver"

    assert_text "Niver was successfully updated"
    click_on "Back"
  end

  test "should destroy Niver" do
    visit niver_url(@niver)
    click_on "Destroy this niver", match: :first

    assert_text "Niver was successfully destroyed"
  end
end
