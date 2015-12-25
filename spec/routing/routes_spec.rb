require 'rails_helper'

RSpec.describe "", :type => :routing do
  it "routes / to events#index" do
    expect(:get => "/").to route_to(
      :controller => "events",
      :action => "index"
    )
  end

  it "routes /search to events#search" do
    expect(:get => "/search").to route_to(
      :controller => "events",
      :action => "search"
    )
  end

  it "routes /signup to users#new" do
    expect(:get => "/signup").to route_to(
      :controller => "users",
      :action => "new"
    )
  end

  it "routes /login to session#new" do
    expect(:get => "/login").to route_to(
      :controller => "session",
      :action => "new"
    )
  end

  it "Can't signout if user doesn't login yet" do
    expect(:get => "/sigout").not_to be_routable
  end

end
