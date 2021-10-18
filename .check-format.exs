# Override default config from .check.exs
[
  tools: [
    # Custom tools
    {:css_format, "./run css:format"},
    {:dockerfile_format, "./run dockerfile:format"},
    {:elixir_format, "./run elixir:format"},
    {:elixir_eex_format, "./run elixir:eex:format", deps: [:css_format, :js_format]},
    {:js_format, "./run js:format"},
    {:prettier_format, "./run prettier:format", deps: [:css_format, :js_format]},
    {:shell_format, "./run shell:format"}
  ]
]
