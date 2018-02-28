defmodule MultirotorUsers.Users do
  use Ecto.Schema

  import Ecto.Changeset

  alias Ueberauth.Auth
  alias Comeonin.Bcrypt

  schema "users" do
    field :name, :string
    field :email, :string
    field :salt, :string
    field :password, :string

    timestamps()
  end

  def authenticate(%Auth{provider: :identity} = auth) do
    Repo.get_by(__MODULE__, email: auth.uid)
    |> Comeonin.Bcrypt.authorize(auth)
  end

  def changeset(user, params \\ %{}) do
    user
    |> cast(params, [:name, :email, :salt, :password])
    |> validate_password(:password)
    |> put_pass_hash()
  end

  def validate_password(changeset, field, options \\ []) do
    validate_change(changeset, field, fn _, password ->
      case valid_password?(password) do
        {:ok, _} -> []
        {:error, msg} -> [{field, options[:message] || msg}]
      end
    end)
  end

  defp put_pass_hash(%Ecto.Changeset{valid?: true, changes:
    %{password: password}} = changeset) do
      change(changeset, Comeonin.Bcrypt.add_hash(password))
  end
  defp put_pass_hash(changeset), do: changeset

  defp valid_password?(password) when byte_size(password) > 7 do
      {:ok, password}
  end
  defp valid_password?(_), do: {:error, "The password is too short"}

  defp authorize(nil,_auth), do: {:error, "Invalid username or password"}
  defp authorize(user, auth) do
    checkpw(auth.credentials.other.password, user.password)
    |> resolve_authorization(user)
  end

  defp resolve_authorization(false, _user), do: {:error, "Invalid username or password"}
  defp resolve_authorization(true, user), do: {:ok, user}
end
