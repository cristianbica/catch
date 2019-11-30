defmodule Catch.Repo.Migrations.CreateRequests do
  use Ecto.Migration

  def change do
    create table(:requests) do
      add :path, :string
      add :verb, :string
      add :content_type, :string
      add :params, :map
      add :headers, :map

      timestamps()
    end

  end
end
