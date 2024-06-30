defmodule App.MixProject do
  use Mix.Project

  def project do
    [
      app: :app,
      version: "2021.10.0",
      elixir: "~> 1.16",
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
      {:credo, ">= 1.6.3", only: :test, runtime: false},
      {:credo_contrib, ">= 0.2.0", only: :test, runtime: false},
      {:credo_naming, ">= 1.0.0", only: :test, runtime: false},
      {:dialyxir, ">= 1.1.0", only: :test, runtime: false},
      {:doctor, ">= 0.18.0", only: :test, runtime: false},
      {:ex_check, ">= 0.14.0", only: [:dev, :test], runtime: false},
      {:excoveralls, ">= 0.14.4", only: :test, runtime: false},
      {:mix_audit, ">= 2.1.0", only: [:dev], runtime: false},
      {:sobelow, ">= 0.11.1", only: :test, runtime: false}
    ]
  end

  defp aliases do
    [
      check: ["check --config .check_dev.exs"],
      "check.ci": ["check --config .check_ci.exs"],
      "format.all": [
        "check --config .check_format.exs \
          --only format_css \
          --only format_dockerfile \
          --only format_elixir \
          --only format_js \
          --only format_prettier \
          --only format_shell \
        "
      ],
      "npm.dev": ["cmd npm ci --quiet"],
      "npm.ci": ["cmd npm ci --quiet"],
      "setup.deps": ["deps.unlock --unused", "deps.clean --unused", "deps.get"],
      "setup.deps.dev": ["setup.deps", "npm.dev"],
      "setup.deps.ci": ["setup.deps", "deps.compile"],
      "sobelow.default": ["sobelow --config --exit"],
      test: ["test --warnings-as-errors"],
      "test.cover": ["test --cover"],
      "test.cover.recent": ["test.cover --stale"],
      "test.recent": ["test --stale"]
    ]
  end

  defp preferred_cli_env do
    [
      "check.ci": :test,
      compile: :test,
      credo: :test,
      coveralls: :test,
      "coveralls.detail": :test,
      "coveralls.html": :test,
      "coveralls.json": :test,
      dialyxir: :test,
      dialyzer: :test,
      doctor: :test,
      "format.all": :dev,
      "test.cover": :test,
      "test.cover.recent": :test,
      "test.recent": :test,
      sobelow: :test,
      "sobelow.default": :test
    ]
  end

  defp dialyzer do
    [
      ignore_warnings: ".dialyzer_ignore.exs",
      flags: [
        :error_handling,
        :underspecs,
        :unmatched_returns
      ],
      plt_add_apps: [
        :ex_unit,
        :mix
      ],
      plt_add_deps: :apps_direct,
      plt_local_path: "dialyzer/plts"
    ]
  end

  defp test_coverage do
    [tool: ExCoveralls]
  end
end
