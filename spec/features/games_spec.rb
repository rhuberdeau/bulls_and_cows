require 'rails_helper'

RSpec.feature "Games", type: :feature do
  scenario "User starts a game" do
    visit "/"
    expect(page).to have_link "Start a game"
    click_link 'Start a game'
    expect(page).to have_text "Please enter a guess"
  end

  scenario "User enters a guess" do
    game = Game.create!(word: "enfix")
    visit game_path(game)
    fill_in "guess[word]", with: "enarm"
    click_button "Submit"
    expect(page).to have_text "bulls: 2 cows: 0"
  end
end
