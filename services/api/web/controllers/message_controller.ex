defmodule Api.MessageController do
  use Api.Web, :controller

  alias Api.Message

  def index(conn, _params) do
    messages = Repo.all(Message)
    render(conn, "index.json", messages: messages)
  end
end
