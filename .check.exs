# Override default config from the "ex_check"
# https://github.com/karolsluszniak/ex_check/blob/master/lib/ex_check/config/default.ex
[
  retry: false,
  tools: [
    # Extends curated tools from ex_check
    {
      :doctor,
      "mix doctor --summary",
      detect: [
        {:package, :doctor},
        {:elixir, ">= 1.8.0"}
      ]
    },
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

    # Custom tools
    {:dockerfile_lint, "./run dockerfile:lint"},
    {:elixir_eex_lint, "./run elixir:eex:lint"},
    {:markdown_lint, "./run markdown:lint"},
    {:prettier_lint, "./run prettier:lint"},
    {:shell_lint, "./run shell:lint"},
    {:spellcheck_lint, "./run spellcheck:lint"}
  ]
]
