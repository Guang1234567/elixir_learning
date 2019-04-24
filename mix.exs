defmodule ElixirLearning.MixProject do
  use Mix.Project

  def project do
    [
      app: :elixir_learning,
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      escript: escript()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:earmark, "~> 1.3", only: :dev},
      {:ex_doc, "~> 0.20", only: :dev},

      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"},
      {:reaxive, "~> 0.1.0"},

      {:phoenix, "~> 1.4"},
      {:phoenix_html, "~> 2.13"},
      {:cowboy, "~> 1.0", only: [:dev, :test]},
      {:slime, "~> 0.14"}
    ]
  end

  # 配置 main 方法
  defp escript do
    [main_module: ElixirLearning]
  end
end
