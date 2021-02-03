defmodule Api.Conversation.Messages do
  use Ecto.Schema
  import Ecto.Changeset

  schema "messages" do
    field :content, :string
    field :userid, :string

    timestamps()
  end

  @doc false
  def changeset(messages, attrs) do
    messages
    |> cast(attrs, [:userid, :content])
    |> validate_required([:userid, :content])
  end
end
