require 'rails_helper'

RSpec.describe "games/new", type: :view do
  before(:each) do
    assign(:game, Game.new(
      :word => "MyString"
    ))
  end

  it "renders new game form" do
    render

    assert_select "form[action=?][method=?]", games_path, "post" do

      assert_select "input[name=?]", "game[word]"
    end
  end
end
