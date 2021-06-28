%{
  configs: [
    %{
      name: "default",
      files: %{
        included: ["lib/", "test/", "mix.exs", ".credo.exs", ".formatter.exs"],
        excluded: []
      },
      strict: true,
      checks: [
        {Credo.Check.Design.AliasUsage, []},
        # Avoid vscode-elixir-credo showing warnings wherease credo excludes ".exs" files.
        # see: https://github.com/rrrene/credo/blob/master/lib/credo/check/readability/module_doc.ex
        {Credo.Check.Readability.MaxLineLength, [max_length: 98]},
        {Credo.Check.Readability.ModuleDoc, [files: %{excluded: ["**/*.exs"]}]},
        {Credo.Check.Warning.MixEnv, [files: %{excluded: ["mix.exs"]}]},

        # Controversial and experimental checks
        {Credo.Check.Consistency.MultiAliasImportRequireUse, []},
        {Credo.Check.Consistency.UnusedVariableNames, []},
        {Credo.Check.Design.DuplicatedCode, []},
        {Credo.Check.Readability.AliasAs, []},
        {Credo.Check.Readability.BlockPipe, []},
        {Credo.Check.Readability.ImplTrue, []},
        {Credo.Check.Readability.MultiAlias, []},
        {Credo.Check.Readability.SeparateAliasRequire, []},
        {Credo.Check.Readability.SinglePipe, []},
        {Credo.Check.Readability.Specs, [files: %{excluded: ["mix.exs"]}]},
        {Credo.Check.Readability.StrictModuleLayout, []},
        {Credo.Check.Readability.WithCustomTaggedTuple, []},
        {Credo.Check.Refactor.ABCSize, []},
        {Credo.Check.Refactor.AppendSingleItem, []},
        {Credo.Check.Refactor.DoubleBooleanNegation, []},
        {Credo.Check.Refactor.ModuleDependencies, []},
        {Credo.Check.Refactor.NegatedIsNil, []},
        {Credo.Check.Refactor.PipeChainStart, []},
        {Credo.Check.Refactor.VariableRebinding, []},
        {Credo.Check.Warning.LeakyEnvironment, []},
        {Credo.Check.Warning.MapGetUnsafePass, []},
        {Credo.Check.Warning.UnsafeToAtom, []}
      ]
    }
  ]
}
