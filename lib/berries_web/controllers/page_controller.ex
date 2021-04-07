defmodule BerriesWeb.PageController do
  use BerriesWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
