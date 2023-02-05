# Override default config from .check.exs
[
  tools: [
    # Custom tools
    {:format_css, "./run format:css"},
    {:format_dockerfile, "./run format:dockerfile"},
    {:format_elixir, "./run format:elixir"},
    {:format_js, "./run format:js"},
    {:format_prettier, "./run format:prettier", deps: [:format_css, :format_js]},
    {:format_shell, "./run format:shell"}
  ]
]
