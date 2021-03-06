defmodule Compass.Mixfile do
  use Mix.Project

  def project do
    [
      app: :compass,
      version: "0.0.3",
      elixir: "~> 1.3",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      name: "Compass",
      deps: deps(),
      description: description(),
      package: package(),
    ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:credo, "~> 0.4", only: [:dev, :test]},
      {:ecto, "~> 2.0"},
      {:ex_doc, "~> 0.13", only: :dev},
      {:orientex, "~> 0.0"},
    ]
  end

  defp description do
    """
    An abstraction for Orientex.
    """
  end

  defp package do
    [
      files: ["config", "lib", "test", ".gitignore", "LICENSE*", "mix.exs", "README*"],
      maintainers: ["Austin S. Morris"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/austinsmorris/compass"},
    ]
  end
end
