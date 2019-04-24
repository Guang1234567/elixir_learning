defmodule ElixirLearning do
  #  def main(args \\ []) do
  #    hello("678999")
  #  end

  @moduledoc """
  Documentation for ElixirLearning.
  """

  @doc """
  Hello world.

  ## Examples

      iex> ElixirLearning.hello("some args")
      :world

  """
  def hello(name) do
    IO.puts("#{name}")
    :world
  end
end

defmodule Example do
  def add(a, b) do
    IO.puts(a + b)
  end

  def explode, do: exit(:kaboom)

  def listen do
    receive do
      {:ok, "hello"} -> IO.puts("World")
      {:ok, "exit"} -> explode
    end

    listen
  end

  def run do
    {pid, ref} = spawn_monitor(Example, :explode, [])

    receive do
      {:DOWN, ref, :process, from_pid, reason} -> IO.puts("Exit reason: #{reason}")
    end
  end
end

defmodule SimpleQueue do
  use GenServer

  ### GenServer API

  @doc """
  GenServer.init/1 callback
  """
  def init(state), do: {:ok, state}

  @doc """
  GenServer.handle_call/3 callback
  """
  def handle_call(:dequeue, _from, [value | state]) do
    {:reply, value, state}
  end

  def handle_call(:dequeue, _from, []), do: {:reply, nil, []}

  def handle_call(:queue, _from, state), do: {:reply, state, state}

  ### Client API / Helper functions

  def start_link(state \\ []) do
    GenServer.start_link(__MODULE__, state, name: __MODULE__)
  end

  def queue do
    case GenServer.call(__MODULE__, :queue) do
      [head | tail] ->
        [head | tail] = GenServer.call(__MODULE__, :queue)
        IO.puts("queue head: #{head}  tail: #{tail}}")

      _ ->
        []
    end
  end

  def dequeue, do: GenServer.call(__MODULE__, :dequeue)
end
