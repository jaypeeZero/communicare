defmodule Api.TodoControllerTest do
  use Api.ConnCase
  import Api.Factory

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Welcome to Phoenix!"
  end

  test "/api/todos returns list", %{conn: conn} do
    todo = insert(:todo)
    path = todo_path(conn, :index)
    conn = get(conn, path)

    assert json_response(conn, 200) == %{
             "todos" => [
               %{
                 "title" => todo.title,
                 "description" => todo.description,
                 "inserted_at" =>
                   Ecto.DateTime.cast!(todo.inserted_at)
                   |> Ecto.DateTime.to_iso8601(),
                 "updated_at" =>
                   Ecto.DateTime.cast!(todo.updated_at)
                   |> Ecto.DateTime.to_iso8601()
               }
             ]
           }
  end
end
