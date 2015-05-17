require 'rails_helper'

RSpec.describe "itineraries/edit", type: :view do
  before(:each) do
    @itinerary = assign(:itinerary, Itinerary.create!(
      :user => nil
    ))
  end

  it "renders the edit itinerary form" do
    render

    assert_select "form[action=?][method=?]", itinerary_path(@itinerary), "post" do

      assert_select "input#itinerary_user_id[name=?]", "itinerary[user_id]"
    end
  end
end
