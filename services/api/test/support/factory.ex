defmodule Api.Factory do
  use ExMachina.Ecto, repo: Api.Repo

  def todo_factory do
    %Api.Todo{
      title: "Something I need to do",
      description: "List of steps I need to complete"
    }
  end

  def message_factory do
    %Api.Message{
      username: "JustAPerson",
      text: "c0ol 1337 h4x0rz"
    }
  end
end
