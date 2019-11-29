defmodule Catch.Repo.Migrations.CreateRequests do
  use Ecto.Migration

  def change do
    create table(:requests) do
      add :path, :string
      add :verb, :string
      add :content_type, :string
      add :params, :text
      add :headers, :text
      add :body, :text

      timestamps()
    end

  end
end
