defmodule Vlogger.Annotation do
  use Vlogger.Web, :model

  schema "annotations" do
    field :body, :string
    field :at, :string
    belongs_to :user, Vlogger.User
    belongs_to :video, Vlogger.Video

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:body, :at])
    |> validate_required([:body, :at])
  end
end
