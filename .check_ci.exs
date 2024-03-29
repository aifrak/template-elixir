# Override default config from .check.exs
[
  tools: [
    {
      :ex_unit,
      "mix coveralls.json",
      detect: [
        {:package, :excoveralls, else: :skip},
        {:file, "coveralls.json", else: :skip},
        {:file, "codecov.yml", else: :skip}
      ],
      retry: "mix coveralls.json --failed"
    },
    {:lint_git_commit, "./run lint:git:commit"},
    {:lint_staged, false}
  ]
]
