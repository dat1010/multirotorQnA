defmodule MultirotorUsers.UserValidation do
  import Ecto.Changeset

  def validate_password(changeset, field, options \\ []) do
    validate_change(changeset, field, fn _, password ->
      case valid_password?(password) do
        {:ok, _} -> []
        {:error, msg} -> [{field, options[:message] || msg}]
      end
    end)
  end

  def put_pass_hash(%{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, Comeonin.Bcrypt.add_hash(password))
  end

  def put_pass_hash(changeset), do: changeset

  defp valid_password?(password) when byte_size(password) > 7 do
      {:ok, password}
  end
  defp valid_password?(_), do: {:error, "The password is too short"}

end
