# Override default config from the "ex_check"
# https://github.com/karolsluszniak/ex_check/blob/master/lib/ex_check/config/default.ex
[
  retry: false,
  tools: [
    # —————————————————————————————————————————————— #
    #       Extends curated tools from ex_check      #
    # —————————————————————————————————————————————— #
    {:credo, "./run elixir:credo", detect: [{:package, :credo}]},
    {:dialyzer, "mix dialyzer --format short", detect: [{:package, :dialyxir}]},
    {
      :doctor,
      "mix doctor --summary",
      detect: [
        {:package, :doctor},
        {:elixir, ">= 1.8.0"}
      ]
    },
    {:formatter, "./run elixir:format:lint",
     detect: [{:file, ".formatter.exs"}], fix: "./run elixir:format"},
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
    {:css_lint, "./run css:lint"},
    {:dockerfile_lint, "./run dockerfile:lint"},
    {:elixir_eex_lint, "./run elixir:eex:lint"},
    {:html_lint, "./run html:lint"},
    {:js_lint, "./run js:lint"},
    {:lint_staged, "./run lint-staged"},
    {:markdown_lint, "./run markdown:lint"},
    {:prettier_lint, "./run prettier:lint"},
    {:release_test, "./run release:test"},
    {:shell_lint, "./run shell:lint"},
    {:spellcheck_lint, "./run spellcheck:lint"}
  ]
]
