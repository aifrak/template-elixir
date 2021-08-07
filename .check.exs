[
  tools: [
    # Curated tools from ex_check
    {:compiler, env: %{"MIX_ENV" => "test"}},
    {:ex_doc, env: %{"MIX_ENV" => "test"}},
    {:formatter, env: %{"MIX_ENV" => "test"}},
    {:npm_test, false},
    {
      :sobelow,
      "mix sobelow --config",
      env: %{"MIX_ENV" => "test"}, detect: [{:package, :phoenix, else: :disable}]
    },

    # Custom lints
    {:dockerfile_lint, "./run dockerfile:lint"},
    {:elixir_eex_lint, "./run elixir:eex:lint"},
    {:markdown_lint, "./run markdown:lint"},
    {:prettier_lint, "./run prettier:lint"},
    {:shell_lint, "./run shell:lint"}
  ]
]
