defmodule Api.Todo do
  use Api.Web, :model

  schema "todos" do
    field(:title)
    field(:description)

    timestamps
  end
end
