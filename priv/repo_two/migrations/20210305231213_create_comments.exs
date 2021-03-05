defmodule Multidatabase.RepoTwo.Migrations.CreateComments do
  use Ecto.Migration

  def change do
    create table(:comments) do
      add :comment, :string

      timestamps()
    end

  end
end
