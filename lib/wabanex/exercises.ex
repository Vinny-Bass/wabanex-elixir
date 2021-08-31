defmodule Wabanex.Exercises do
  use Ecto.Schema
  import Ecto.Changeset

  alias Wabanex.Training

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @fields [
    :name,
    :video_url,
    :protocol_description,
    :repetitions,
    :training_id
  ]

  schema "exercises" do
    field :name, :string
    field :video_url, :string
    field :protocol_description, :string
    field :repetitions, :string

    belongs_to :training, Training
  end

  def changeset(exercise, params) do
    exercise
    |> cast(params, @fields)
    |> validate_required(@fields)
  end
end
