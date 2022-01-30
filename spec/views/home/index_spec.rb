require 'rails_helper'

RSpec.describe "home/index" do

  scenario "All structural and informational elements should be present on the homepage" do
    # Load view
    render

    # Main Content
    expect(rendered).to have_content "Bienvenido a tu contador de palabras"
    expect(rendered).to have_content "Puedes escribir un texto o cargar un archivo para el conteo de palabras"

    expect(rendered).to have_content "Escribir"
    expect(rendered).to have_content "Cargar"

    expect(rendered).to have_content "Contar"
  end
end
