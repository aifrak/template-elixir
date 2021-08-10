# Override default config from .check.exs
[
  tools: [
    {
      :ex_unit,
      "mix test.cover",
      env: %{"MIX_ENV" => "test"},
      detect: [
        {:package, :excoveralls, else: :skip},
        {:file, "coveralls.json", else: :skip},
        {:file, "codecov.yml", else: :skip}
      ],
      retry: "mix test.cover --failed"
    }
  ]
]
