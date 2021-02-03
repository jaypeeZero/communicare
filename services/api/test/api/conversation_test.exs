defmodule Api.ConversationTest do
  use Api.DataCase

  alias Api.Conversation

  describe "messages" do
    alias Api.Conversation.Messages

    @valid_attrs %{content: "some content", date: ~N[2010-04-17 14:00:00], userid: "some userid"}
    @update_attrs %{content: "some updated content", date: ~N[2011-05-18 15:01:01], userid: "some updated userid"}
    @invalid_attrs %{content: nil, date: nil, userid: nil}

    def messages_fixture(attrs \\ %{}) do
      {:ok, messages} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Conversation.create_messages()

      messages
    end

    test "list_messages/0 returns all messages" do
      messages = messages_fixture()
      assert Conversation.list_messages() == [messages]
    end

    test "get_messages!/1 returns the messages with given id" do
      messages = messages_fixture()
      assert Conversation.get_messages!(messages.id) == messages
    end

    test "create_messages/1 with valid data creates a messages" do
      assert {:ok, %Messages{} = messages} = Conversation.create_messages(@valid_attrs)
      assert messages.content == "some content"
      assert messages.date == ~N[2010-04-17 14:00:00]
      assert messages.userid == "some userid"
    end

    test "create_messages/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Conversation.create_messages(@invalid_attrs)
    end

    test "update_messages/2 with valid data updates the messages" do
      messages = messages_fixture()
      assert {:ok, %Messages{} = messages} = Conversation.update_messages(messages, @update_attrs)
      assert messages.content == "some updated content"
      assert messages.date == ~N[2011-05-18 15:01:01]
      assert messages.userid == "some updated userid"
    end

    test "update_messages/2 with invalid data returns error changeset" do
      messages = messages_fixture()
      assert {:error, %Ecto.Changeset{}} = Conversation.update_messages(messages, @invalid_attrs)
      assert messages == Conversation.get_messages!(messages.id)
    end

    test "delete_messages/1 deletes the messages" do
      messages = messages_fixture()
      assert {:ok, %Messages{}} = Conversation.delete_messages(messages)
      assert_raise Ecto.NoResultsError, fn -> Conversation.get_messages!(messages.id) end
    end

    test "change_messages/1 returns a messages changeset" do
      messages = messages_fixture()
      assert %Ecto.Changeset{} = Conversation.change_messages(messages)
    end
  end
end
