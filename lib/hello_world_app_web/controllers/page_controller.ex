defmodule HelloWorldAppWeb.PageController do
  use HelloWorldAppWeb, :controller

  def index(conn, _params) do
    text(conn, "Hello World!")
  end
end
