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
      assert_select "input#itinerary_start_date[name=?]", "itinerary[start_date]"
      assert_select "input#itinerary_end_date[name=?]", "itinerary[end_date]"
    end
  end
end
