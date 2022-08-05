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
    {:git_commit_lint, "./run git:commit:lint"},
    {:lint_staged, false}
  ]
]
