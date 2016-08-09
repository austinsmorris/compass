defmodule Compass.RepoTest do
  use ExUnit.Case

  alias Compass.Repo

  test "get config returns otp app and config" do
    {otp_app, config} = Repo.get_config(Repo, [otp_app: :compass])
    assert otp_app == :compass
    assert config == [foo: "bar"]
  end
end
