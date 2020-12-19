defmodule Cloudini.Mixfile do
  use Mix.Project

  def project do
    [
      app: :cloudini,
       version: "1.2.0",
       elixir: "~> 1.2",
       build_embedded: Mix.env == :prod,
       start_permanent: Mix.env == :prod,
       description: "Cloudinary client",
       package: package(),
       deps: deps(),
       docs: [
         extras: ["README.md"],
         main: "readme"
       ]
     ]
  end

  def application do
    [applications: [:logger, :crypto]]
  end

  defp deps do
    [
      {:poison, "~> 3.0"},
      {:ex_doc, ">= 0.0.0", only: :dev},
      {:exvcr, "~> 0.8", only: [:test]}
    ]
  end

  defp package do
    [
      maintainers: ["Adrian Gruntkowski", "Adam Rutkowski"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/socialpaymentsbv/cloudini"}
    ]
  end
end
