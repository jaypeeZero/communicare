defmodule Api.Message do
  use Api.Web, :model

  schema "messages" do
    field(:username)
    field(:text)

    timestamps()
  end
end
