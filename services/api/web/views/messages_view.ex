defmodule Api.MessageView do
  use Api.Web, :view

  def render("index.json", %{messages: messages}) do
    %{messages: Enum.map(messages, &message_json/1)}
  end

  def message_json(message) do
    %{
      username: message.username,
      text: message.text
    }
  end
end
