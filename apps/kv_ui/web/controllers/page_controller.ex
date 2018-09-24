defmodule KvUi.PageController do
  use KvUi.Web, :controller
  alias KV.Registry

  def index(conn, _params) do
    render conn, "index.html"
  end

  def fail(conn, _params) do
    Registry.lookup(KV.Registry, "shopping")
    render conn, "index.html"
  end

  def success(conn, _params) do
    :ok = Registry.create(KV.Registry, "shopping_#{Enum.random(1..100)}")
    render conn, "index.html"
  end
end
