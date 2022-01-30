require 'rails_helper'

RSpec.describe "home", :type => :feature do

  describe "When a user writes a text in the field and gives it count" do
    scenario "Should count the words show a histogram" do
      visit root_path

      expect(current_path).to eq(root_path)

      fill_in "count_words[text]", :with => "lumu lumu lumu lumu lumu illuminates illuminates attacks and adversaries lumu illuminates all attacks and adversaries"

      click_on "Contar"

      expect(current_path).to eq(count_words_path)

      expect(page).to have_text("Histograma")
      expect(page).to have_text("Acá puedes ver la cantidad de palabras que tenía tu texto!")
    end
  end

  describe "When a user does not write anything in the text field and gives it count" do
    scenario "Should show you an empty field error" do
      visit root_path

      expect(current_path).to eq(root_path)

      fill_in "count_words[text]", :with => ""

      click_on "Contar"

      expect(current_path).to eq(root_path)

      expect(page).to have_text("Lo sentimos, no escribiste ningún texto. Vuelve a intentarlo")
    end
  end

  describe "When a user uploads a txt file and gives it count" do
    scenario "Should count the words and show a histogram" do
      visit root_path

      expect(current_path).to eq(root_path)

      attach_file('count_words[file]', Rails.root + "spec/factories/files/texto.txt", make_visible: true)

      click_on "Contar"

      expect(current_path).to eq(count_words_path)

      expect(page).to have_text("Histograma")
      expect(page).to have_text("Acá puedes ver la cantidad de palabras que tenía tu texto!")
    end
  end

  describe "When a user does not upload a txt and gives it count" do
    scenario "Should show you an empty field error" do
      visit root_path

      expect(current_path).to eq(root_path)

      click_on "Contar"

      expect(current_path).to eq(root_path)

      expect(page).to have_text("Lo sentimos, no cargaste ningún archivo. Vuelve a intentarlo")
    end
  end

  describe "When a user uploads a file other than a txt" do
    scenario "Should show you an error" do
      visit root_path

      expect(current_path).to eq(root_path)

      attach_file('count_words[file]', Rails.root + "spec/factories/files/texto.pdf", make_visible: true)

      click_on "Contar"

      expect(current_path).to eq(root_path)

      expect(page).to have_text("Lo sentimos, sólo aceptamos archivos con extensión .txt")
    end
  end
end
