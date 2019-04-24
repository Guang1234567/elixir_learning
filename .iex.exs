# https://samuelmullen.com/articles/customizing_elixirs_iex/

File.exists?(Path.expand("~/.iex.exs")) && import_file("~/.iex.exs")

defmodule IExHelpers do
  def whats_this?(term) when is_nil(term), do: "Type: Nil"
  def whats_this?(term) when is_binary(term), do: "Type: Binary"
  def whats_this?(term) when is_boolean(term), do: "Type: Boolean"
  def whats_this?(term) when is_atom(term), do: "Type: Atom"
  def whats_this?(_term), do: "Type: Unknown"
end

import List


test_list_001=["foo", "bar", "hello"]

