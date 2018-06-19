defmodule MultirotorUser.UserAuthentication do
  alias Ueberauth.Auth


  def authenticate(%Auth{provider: :identity} = auth) do
    MultirotorUser.Accounts.get_by_email(auth.uid)
    |> Comeonin.Bcrypt.check_pass(Map.get(auth.extra.raw_info,"password"))
  end

  defp authorize(nil,_auth), do: {:error, "Invalid username or password"}
  defp authorize(user, auth) do
    checkpw(auth.credentials.other.password, user.password)
    |> resolve_authorization(user)
  end

  defp resolve_authorization(false, _user), do: {:error, "Invalid username or password"}
  defp resolve_authorization(true, user), do: {:ok, user}

end
