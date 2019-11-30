defmodule Catch.Requests.Request do
  use Ecto.Schema
  import Ecto.Changeset

  schema "requests" do
    field :content_type, :string
    field :headers, :map
    field :params, :map
    field :path, :string
    field :verb, :string

    timestamps()
  end

  @doc false
  def changeset(request, attrs) do
    request
    |> cast(attrs, [:path, :verb, :content_type, :params, :headers])
    |> validate_required([:path, :verb, :content_type, :params, :headers])
  end
end
