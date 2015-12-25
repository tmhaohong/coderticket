require 'rails_helper'

RSpec.describe "session/new", type: :view do
  it "renders signin page" do
    render
    expect(rendered).to include("Sign in")
  end
end
