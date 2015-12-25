require 'rails_helper'

RSpec.describe "events/index", type: :view do
  it "renders list of events" do
    assign(:events, [instance_double("Event", :hero_image_url => "image.jpg", :name => "asd", :starts_at => DateTime.parse('Fri, 11 Mar 2016 7:00 AM+0700'))])
    render
    expect(view).to render_template(:partial => "event", :count => 1)
  end
end
