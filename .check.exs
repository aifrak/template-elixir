# Override default config from the "ex_check"
[
  retry: false,
  tools: [
    # Curated tools from ex_check
    {:compiler, env: %{"MIX_ENV" => "test"}},
    {
      :doctor,
      "mix doctor --summary",
      detect: [
        {:package, :doctor},
        {:elixir, ">= 1.8.0"}
      ]
    },
    {:ex_doc, env: %{"MIX_ENV" => "test"}},
    {:formatter, env: %{"MIX_ENV" => "test"}},
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
    {:shell_lint, "./run shell:lint"}
  ]
]
