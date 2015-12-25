require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  describe "GET #new" do
    it "responds successfully with an HTTP 200 status code" do
      get :new
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
    it "renders the new event template" do
      get :new
      expect(response).to render_template("new")
    end
    it "Do searching and responds successfully with an HTTP 200 status code" do
      get :search
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
    it "renders the search event template" do
      get :search, {query:"asd"}
      expect(response).to render_template("search")
      expect(assigns(:events)).to match_array([])
    end
  end
end
