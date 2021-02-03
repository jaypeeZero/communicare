defmodule Api.Schema do
  use Absinthe.Schema

  require Logger

  import_types(Api.Schema.DataTypes)

  query do
    @desc "Get a list of messages"
    field :messages, list_of(:message) do
      resolve(fn _parent, _args, _resolution ->
        {:ok, Api.Conversation.list_messages()}
      end)
    end
  end

  mutation do
    @desc "Create a message"
    field :create_message, type: :message do
      arg(:content, non_null(:string))
      arg(:userid, non_null(:string))

      resolve(&Api.Conversation.Resolver.create_message/3)
    end
  end
end
