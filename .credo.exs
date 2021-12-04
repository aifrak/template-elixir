# Override default config from the "credo"
%{
  configs: [
    %{
      name: "default",
      strict: true,
      files: %{
        included: [
          "config/",
          "lib/",
          "test/",
          "*.exs",
          ".sobelow-conf",
          "apps/*/lib/",
          "apps/*/test/",
          "apps/*/*.exs",
          "apps/*/.sobelow-conf",
          "apps/*/mix.exs"
        ],
        excluded: [
          ~r"/_build/",
          ~r"/.elixir_ls/",
          ~r"/.git/",
          ~r"/.history/",
          ~r"/assets/",
          ~r"/cover/",
          ~r"/deps/",
          ~r"/doc/",
          ~r"/node_modules/",
          ~r"/npm_cache/",
          ~r"/dialyzer/plts/"
        ]
      },
      checks: %{
        # Default checks from Credo are automatically merged with the current config
        extra: [
          # —————————————————————————————————————————————— #
          #              Override core checks              #
          # —————————————————————————————————————————————— #
          {Credo.Check.Design.AliasUsage, []},
          {Credo.Check.Readability.MaxLineLength, [max_length: 98]},

          # —————————————————————————————————————————————— #
          #            Checks from credo_naming            #
          # —————————————————————————————————————————————— #
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

          # —————————————————————————————————————————————— #
          #            Checks from credo_contrib           #
          # —————————————————————————————————————————————— #
          {CredoContrib.Check.DocWhitespace, []},
          {CredoContrib.Check.EmptyDocString, []},
          {CredoContrib.Check.EmptyTestBlock, []},
          {CredoContrib.Check.FunctionBlockSyntax, []},
          {CredoContrib.Check.FunctionNameUnderscorePrefix, []},
          {CredoContrib.Check.ModuleAlias, []},
          {CredoContrib.Check.PublicPrivateFunctionName, []},

          # —————————————————————————————————————————————— #
          #      Controversial and experimental checks     #
          # —————————————————————————————————————————————— #
          {Credo.Check.Consistency.MultiAliasImportRequireUse, []},
          {Credo.Check.Consistency.UnusedVariableNames, []},
          {Credo.Check.Design.DuplicatedCode, []},
          {Credo.Check.Design.SkipTestWithoutComment,
           [included: ["test/**/*_test.exs", "apps/*/test/**/*_test.exs"]]},
          {Credo.Check.Readability.AliasAs, []},
          {Credo.Check.Readability.BlockPipe, []},
          {Credo.Check.Readability.ImplTrue, []},
          {Credo.Check.Readability.MultiAlias, []},
          {Credo.Check.Readability.PipeIntoAnonymousFunctions, []},
          {Credo.Check.Readability.SeparateAliasRequire, []},
          {Credo.Check.Readability.SingleFunctionToBlockPipe, []},
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
          {Credo.Check.Refactor.Apply, []},
          {Credo.Check.Refactor.DoubleBooleanNegation, []},
          {Credo.Check.Refactor.IoPuts, []},
          {Credo.Check.Refactor.MapJoin, []},
          {Credo.Check.Refactor.ModuleDependencies, []},
          {Credo.Check.Refactor.NegatedIsNil, []},
          {Credo.Check.Refactor.RedundantWithClauseResult, []},
          {Credo.Check.Refactor.PipeChainStart, []},
          {Credo.Check.Refactor.VariableRebinding, []},
          {Credo.Check.Warning.LeakyEnvironment, []},
          {Credo.Check.Warning.MapGetUnsafePass, []},
          {Credo.Check.Warning.MixEnv, []},
          {Credo.Check.Warning.UnsafeToAtom, []}
        ]
      }
    }
  ]
}
