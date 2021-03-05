defmodule Multidatabase.Repo do
  use Ecto.Repo,
    otp_app: :multidatabase,
    adapter: Ecto.Adapters.Postgres
end

defmodule Multidatabase.RepoTwo do
  use Ecto.Repo,
      otp_app: :multidatabase,
      adapter: Ecto.Adapters.Postgres
end

defmodule Multidatabase.RepoThree do
  use Ecto.Repo,
      otp_app: :multidatabase,
      adapter: Ecto.Adapters.Postgres
end

