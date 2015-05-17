require 'rails_helper'

RSpec.describe "itineraries/new", type: :view do
  before(:each) do
    assign(:itinerary, Itinerary.new(
      :user => nil
    ))
  end

  it "renders new itinerary form" do
    render

    assert_select "form[action=?][method=?]", itineraries_path, "post" do

      assert_select "input#itinerary_user_id[name=?]", "itinerary[user_id]"
    end
  end
end
