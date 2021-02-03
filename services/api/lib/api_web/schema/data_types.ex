defmodule Api.Schema.DataTypes do
  use Absinthe.Schema.Notation

  object :message do
    field :content, :string
    field :userid, :string
  end
end
