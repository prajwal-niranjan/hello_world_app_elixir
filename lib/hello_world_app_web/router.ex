defmodule HelloWorldAppWeb.Router do
  use HelloWorldAppWeb, :router

  pipeline :api do
    plug :accepts, ["json", "text"]
  end

  scope "/", HelloWorldAppWeb do
    pipe_through :api
    get "/", PageController, :index
  end
end
