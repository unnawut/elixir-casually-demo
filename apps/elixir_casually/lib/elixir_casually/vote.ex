defmodule ElixirCasually.Vote do
  @enforce_keys [
    :citizen_id,
    :vote_number
  ]
  defstruct [
    :citizen_id,
    :vote_number
  ]
end
