module.exports = {
  extends: "@commitlint/config-conventional",
  rules: {
    "subject-case": [2, "always", ["sentence-case"]],
    "scope-case": [2, "always", ["kebab-case"]],
    "scope-enum": [
      2,
      "always",
      [
        "app",
        "cache",
        "config",
        "deps",
        "deps-dev",
        "dev",
        "docker",
        "git",
        "lint",
        "logs",
        "npm",
        "license",
        "readme",
        "security",
        "scripts",
        "vscode",
      ],
    ],
  },
};
