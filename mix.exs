defmodule App.MixProject do
  use Mix.Project

  def project do
    [
      app: :app,
      version: "0.1.0",
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases(),
      preferred_cli_env: preferred_cli_env(),
      dialyzer: dialyzer(),
      test_coverage: test_coverage()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:credo, ">= 1.5.6", only: :test, runtime: false},
      {:credo_contrib, ">= 0.2.0", only: :test, runtime: false},
      {:credo_naming, ">= 1.0.0", only: :test, runtime: false},
      {:dialyxir, ">= 1.1.0", only: :test, runtime: false},
      {:doctor, ">= 0.18.0", only: :test, runtime: false},
      {:ex_check, ">= 0.14.0", only: :test, runtime: false},
      {:excoveralls, ">= 0.14.2", only: :test, runtime: false},
      {:sobelow, ">= 0.11.1", only: :test, runtime: false}
    ]
  end

  defp aliases do
    [
      check: ["check --config .check-dev.exs"],
      "check.ci": ["check --config .check-ci.exs"],
      "compile.ci": ["compile"],
      install_deps: ["deps.unlock --unused", "deps.clean --unused", "deps.get"],
      "install_deps.ci": ["install_deps", "deps.compile"],
      "sobelow.default": ["sobelow --config --exit"],
      test: ["test --warnings-as-errors"],
      "test.cover": ["test --cover"],
      "test.cover.recent": ["test --cover --stale"]
    ]
  end

  defp preferred_cli_env do
    [
      check: :test,
      "check.ci": :test,
      "compile.ci": :test,
      credo: :test,
      coveralls: :test,
      "coveralls.detail": :test,
      "coveralls.html": :test,
      "coveralls.json": :test,
      dialyxir: :test,
      dialyzer: :test,
      doctor: :test,
      sobelow: :test,
      "test.cover": :test,
      "test.cover.recent": :test,
      "sobelow.default": :test
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

  defp test_coverage do
    [tool: ExCoveralls]
  end
end
