defmodule Api.Repo.Migrations.RemoveDateColumn do
  use Ecto.Migration

  def change do
    alter table(:messages) do
      remove :date
    end
  end
end
