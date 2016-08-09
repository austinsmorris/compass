defmodule Compass.Repo do
  @moduledoc false

  def get_config(module, opts) do
    otp_app = Keyword.fetch!(opts, :otp_app)
    config  = Application.get_env(otp_app, module, [])
    {otp_app, config}
  end

  defmacro __using__(opts) do
    quote bind_quoted: [opts: opts] do
      alias Compass.Repo, as: CompassRepo

      {otp_app, config} = CompassRepo.get_config(__MODULE__, opts)
      @config  config
      @default_opts [name: Orientex]
      @otp_app otp_app

      def start_link(opts \\ []) do
        repo_opts = @default_opts |> Keyword.merge(@config) |> Keyword.merge(opts)
        Orientex.start_link(repo_opts)
      end

      def command(query, params \\ [], opts \\ []) do
        Orientex.command(Orientex, query, params, opts)
      end
    end
  end
end
