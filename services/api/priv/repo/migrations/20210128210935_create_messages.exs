defmodule Api.Repo.Migrations.CreateMessages do
  use Ecto.Migration

  def change do
    create table(:messages) do
      add :date, :naive_datetime
      add :userid, :string
      add :content, :string

      timestamps()
    end

  end
end
