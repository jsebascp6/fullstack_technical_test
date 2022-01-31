require 'rails_helper'

RSpec.describe "count_words/results/show" do

  scenario "All structural and informational elements should be present on the frequency results page" do
    # Load view
    render

    # Main Content
    expect(rendered).to have_content "Histograma"
    expect(rendered).to have_content "Acá puedes ver la cantidad de palabras que tenía tu texto!"
  end
end
