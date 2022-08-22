# Override default config from the "ex_check"
# https://github.com/karolsluszniak/ex_check/blob/master/lib/ex_check/config/default.ex
[
  retry: false,
  tools: [
    # —————————————————————————————————————————————— #
    #       Extends curated tools from ex_check      #
    # —————————————————————————————————————————————— #
    {:credo, "./run lint:elixir:credo", detect: [{:package, :credo}]},
    {:dialyzer, "mix dialyzer --format short", detect: [{:package, :dialyxir}]},
    {
      :doctor,
      "mix doctor --summary",
      detect: [
        {:package, :doctor},
        {:elixir, ">= 1.8.0"}
      ]
    },
    {:formatter, "./run lint:elixir:format",
     detect: [{:file, ".formatter.exs"}], fix: "./run format:elixir"},
    {:npm_test, false},
    {
      :sobelow,
      "mix sobelow.default",
      umbrella: [recursive: true],
      detect: [
        {:package, :sobelow, else: :skip},
        {:package, :phoenix, else: :skip}
      ]
    },
    # —————————————————————————————————————————————— #
    #                  Custom tools                  #
    # —————————————————————————————————————————————— #
    {:lint_css, "./run lint:css"},
    {:lint_dockerfile, "./run lint:dockerfile"},
    {:lint_elixir_eex, "./run lint:eex"},
    {:lint_html, "./run lint:html"},
    {:lint_js, "./run lint:js"},
    {:lint_staged, "./run lint:staged"},
    {:lint_markdown, "./run lint:markdown"},
    {:lint_prettier, "./run lint:prettier"},
    {:lint_shell, "./run lint:shell"},
    {:lint_spellcheck, "./run lint:spellcheck"},
    {:test_release, "./run test:release"}
  ]
]
