defmodule App.MixProject do
  use Mix.Project

  def project do
    [
      app: :app,
      version: "0.1.0",
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      preferred_cli_env: preferred_cli_env(),
      dialyzer: dialyzer()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:credo, ">= 1.5.6", only: [:test], runtime: false},
      {:credo_contrib, ">= 0.2.0", only: [:test], runtime: false},
      {:credo_naming, ">= 1.0.0", only: [:test], runtime: false},
      {:dialyxir, ">= 1.1.0", only: [:test], runtime: false},
      {:doctor, ">= 0.18.0", only: [:test], runtime: false},
      {:ex_check, ">= 0.14.0", only: [:test], runtime: false},
      {:sobelow, ">= 0.11.1", only: [:test], runtime: false}
    ]
  end

  defp preferred_cli_env do
    [
      check: :test,
      credo: :test,
      dialyxir: :test,
      dialyzer: :test,
      doctor: :test,
      sobelow: :test
    ]
  end

  defp dialyzer do
    [
      ignore_warnings: ".dialyzer_ignore.exs",
      flags: [
        :error_handling,
        :race_conditions,
        :underspecs,
        :unmatched_returns
      ],
      plt_add_apps: [
        :ex_unit,
        :mix
      ],
      plt_add_deps: :apps_direct,
      plt_file: {:no_warn, "priv/plts/dialyzer.plt"}
    ]
  end
end
