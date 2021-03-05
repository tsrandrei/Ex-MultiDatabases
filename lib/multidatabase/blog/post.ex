defmodule Multidatabase.Blog.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :post, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :post])
    |> validate_required([:title, :post])
  end
end
