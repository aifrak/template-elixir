# Override default config from the "credo"
%{
  configs: [
    %{
      name: "default",
      files: %{
        included: [
          "config/",
          "lib/",
          "test/",
          "mix.exs",
          ".check*.exs",
          ".credo.exs",
          ".formatter.exs",
          ".sobelow-conf",
          "apps/*/lib/",
          "apps/*/test/",
          "apps/*/.check*.exs",
          "apps/*/.credo.exs",
          "apps/*/.formatter.exs",
          "apps/*/.sobelow-conf",
          "apps/*/mix.exs"
        ],
        excluded: [
          ~r"/_build/",
          ~r"/.history/",
          ~r"/assets/",
          ~r"/deps/",
          ~r"/node_modules/",
          ~r"/priv/",
          ~r"/vendor/",
          # HACK: Exclude mix.exs because of bug from https://github.com/rrrene/credo/issues/873
          "mix.exs",
          "apps/*/mix.exs"
        ]
      },
      strict: true,
      checks: [
        {Credo.Check.Design.AliasUsage, []},
        {Credo.Check.Readability.MaxLineLength, [max_length: 98]},
        {Credo.Check.Warning.MixEnv, [files: %{excluded: ["mix.exs", "apps/*/mix.exs"]}]},

        # Checks from credo_naming
        {CredoNaming.Check.Warning.AvoidSpecificTermsInModuleNames,
         terms: [
           "Manager",
           "Fetcher",
           "Builder",
           "Persister",
           "Serializer",
           ~r/^Helpers?$/i,
           ~r/^Utils?$/i
         ]},
        {CredoNaming.Check.Consistency.ModuleFilename,
         excluded_paths: [
           "config/",
           "mix.exs",
           "priv/",
           "test/support/",
           "apps/*/config/",
           "apps/*/priv/",
           "apps/*/test/support/",
           "apps/*/mix.exs"
         ],
         acronyms: [{"GraphQL", "graphql"}]},

        # Checks from credo_contrib
        {CredoContrib.Check.DocWhitespace, []},
        {CredoContrib.Check.EmptyDocString, []},
        {CredoContrib.Check.EmptyTestBlock, []},
        {CredoContrib.Check.FunctionBlockSyntax, []},
        {CredoContrib.Check.FunctionNameUnderscorePrefix, []},
        {CredoContrib.Check.ModuleAlias, []},
        {CredoContrib.Check.PublicPrivateFunctionName, []},

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
        {Credo.Check.Readability.Specs, [files: %{excluded: ["mix.exs", "apps/*/mix.exs"]}]},
        # Base on https://github.com/christopheradams/elixir_style_guide#module-attribute-ordering
        {Credo.Check.Readability.StrictModuleLayout,
         [
           order: [
             :shortdoc,
             :moduledoc,
             :behaviour,
             :use,
             :import,
             :require,
             :alias,
             :module,
             :module_attribute,
             :defstruct,
             :opaque,
             :type,
             :typep,
             :callback,
             :macrocallback,
             :optional_callbacks,
             :public_guard,
             :public_macro,
             :public_fun,
             :callback_impl
           ],
           ignore: [
             :private_guard,
             :private_macro,
             :private_fun
           ]
         ]},
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
