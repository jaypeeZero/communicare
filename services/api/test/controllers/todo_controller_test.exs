defmodule Api.TodoControllerTest do
  use Api.ConnCase
  import Api.Factory

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Welcome to Phoenix!"
  end

  test "/api/todos returns list", %{conn: conn} do
    path = todo_path(conn, :index)
    IO.inspect(path)
    conn = get(conn, "/api/todos")
  end

  test "#index renders a list of todos" do
    todo = insert(:todo)
    conn = build_conn()
    path = todo_path(conn, :index)
    # conn = get(conn, path)

    # assert json_response(conn, 200) == %{
    #          "todos" => [
    #            %{
    #              "title" => todo.title,
    #              "description" => todo.description,
    #              "inserted_at" => Ecto.DateTime.to_iso8601(todo.inserted_at),
    #              "updated_at" => Ecto.DateTime.to_iso8601(todo.updated_at)
    #            }
    #          ]
    #        }
  end
end
