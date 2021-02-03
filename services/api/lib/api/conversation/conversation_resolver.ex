defmodule Api.Conversation.Resolver do
  require Logger

  def create_message(_root, args, _info) do
    Logger.debug("Creating message with #{inspect(args)}")
    Api.Conversation.create_messages(args)
  end
end
