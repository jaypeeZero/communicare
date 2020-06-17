defmodule Api.TodoControllerTest do
  use Api.ConnCase
  import Api.Factory
  alias Api.TodoView

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Welcome to Phoenix!"
  end

  test "/api/todos returns list", %{conn: conn} do
    todo = insert(:todo)
    path = todo_path(conn, :index)
    conn = get(conn, path)

    assert json_response(conn, 200) == render_json(TodoView, "index.json", todos: [todo])
  end

  test "/api/todos/:id renders a single todo", %{conn: conn} do
    todo = insert(:todo)

    conn = get(conn, todo_path(conn, :show, todo))

    assert json_response(conn, 200) == render_json(TodoView, "show.json", todo: todo)
  end
end
