defmodule Length do
  @moduledoc false

  # def of([]), do: 0
  # def of([_ | tail]), do: 1 + of(tail) # 递归写法
  # 使用 kernel 模块 的 length 函数.
  def of(list), do: length(list)
end

defmodule Greeter do

  @greeting "Hello"

  def hello(names) when is_list(names) do
    names
    |> Enum.join(", ")
    |> hello
  end

  def hello(name) when is_binary(name) do
    phrase() <> name
  end

  def hello(%{name: person_name}) do
    IO.puts phrase() <> person_name
  end

  defp phrase, do: "#{@greeting}, "

  def greeting(name) do
    ~s(#{@greeting} #{name}.)
  end

end

defmodule Example.User do
  @derive {Inspect, except: [:roles]}
  defstruct name: "Sean", roles: []
end

defmodule Sayings.Greetings do
  def basic(name), do: "Hi, #{name}"
end

# defmodule Example do
#  alias Sayings.Greetings
#
#  def greeting(name), do: Greetings.basic(name)
# end

# Without alias

# defmodule Example do
#  def greeting(name), do: Sayings.Greetings.basic(name)
# end

defmodule Hello do
  defmacro __using__(opts) do
    greeting = Keyword.get(opts, :greeting, "Hi")

    quote do
      def hello(name), do: unquote(greeting) <> ", " <> name
    end
  end
end

# defmodule Example do
#  import Sayings.Greetings
#  use Hello
#  #use Hello, greeting: "Hello"
#
#  def greeting(name), do: basic(name)
# end


handle_result = fn
  {:ok, r} -> IO.puts "Handling result : #{r}}"
  {:ok, _} -> IO.puts "This would be never run as previous will be matched beforehand."
  {:error} -> IO.puts "An error has occurred!"
end