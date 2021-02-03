defmodule Api.Conversation do
  @moduledoc """
  The Conversation context.
  """
  import Ecto.Query, warn: false
  alias Api.Repo
  alias Api.Conversation.Messages

  @doc """
  Returns the list of messages.

  ## Examples

      iex> list_messages()
      [%Messages{}, ...]

  """
  def list_messages do
    Repo.all(Messages)
  end

  @doc """
  Gets a single messages.

  Raises `Ecto.NoResultsError` if the Messages does not exist.

  ## Examples

      iex> get_messages!(123)
      %Messages{}

      iex> get_messages!(456)
      ** (Ecto.NoResultsError)

  """
  def get_messages!(id), do: Repo.get!(Messages, id)

  @doc """
  Creates a messages.

  ## Examples

      iex> create_messages(%{field: value})
      {:ok, %Messages{}}

      iex> create_messages(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_messages(attrs \\ %{}) do
    %Messages{}
    |> Messages.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a messages.

  ## Examples

      iex> update_messages(messages, %{field: new_value})
      {:ok, %Messages{}}

      iex> update_messages(messages, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_messages(%Messages{} = messages, attrs) do
    messages
    |> Messages.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a messages.

  ## Examples

      iex> delete_messages(messages)
      {:ok, %Messages{}}

      iex> delete_messages(messages)
      {:error, %Ecto.Changeset{}}

  """
  def delete_messages(%Messages{} = messages) do
    Repo.delete(messages)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking messages changes.

  ## Examples

      iex> change_messages(messages)
      %Ecto.Changeset{data: %Messages{}}

  """
  def change_messages(%Messages{} = messages, attrs \\ %{}) do
    Messages.changeset(messages, attrs)
  end
end
