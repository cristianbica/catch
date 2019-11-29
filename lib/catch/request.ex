defmodule Catch.Request do
  use Ecto.Schema
  import Ecto.Changeset

  schema "requests" do
    field :body, :string
    field :content_type, :string
    field :headers, :string
    field :params, :string
    field :path, :string
    field :verb, :string

    timestamps()
  end

  @doc false
  def changeset(request, attrs) do
    request
    |> cast(attrs, [:path, :verb, :content_type, :params, :headers, :body])
    |> validate_required([:path, :verb, :content_type, :params, :headers, :body])
  end
end
