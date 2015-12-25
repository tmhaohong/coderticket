require 'rails_helper'

RSpec.describe "users/new", type: :view do
  it "renders signup page" do
    render
    expect(rendered).to include("Sign up")
  end
end
