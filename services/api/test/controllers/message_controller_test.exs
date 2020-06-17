defmodule Api.MessageControllerTest do
  use Api.ConnCase
  import Api.Factory
  alias Api.MessageView

  test "/api/messages returns list", %{conn: conn} do
    message = insert(:message)
    path = message_path(conn, :index)
    conn = get(conn, path)

    assert json_response(conn, 200) ==
             render_json(MessageView, "index.json", %{messages: [message]})
  end
end
