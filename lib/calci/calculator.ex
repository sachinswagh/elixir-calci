defmodule Calci.Calculator do
  use GenServer

  alias Calci.Calculator
  defstruct value: 0

  # APIs
  def start_link do
    GenServer.start_link(__MODULE__, Calculator.new(), name: __MODULE__)
  end

  def add(number) do
    GenServer.call(Calculator, {:add, number})
  end

  def sub(number) do
    GenServer.call(Calculator, {:sub, number})
  end

  def mul(number) do
    GenServer.call(Calculator, {:mul, number})
  end

  def div(number) do
    GenServer.call(Calculator, {:div, number})
  end

  def get() do
    GenServer.call(Calculator, :get)
  end

  # GenServer Callbacks
  def init(_init_value) do
    {:ok, Calculator.new()}
  end

  def handle_call(:get, _from, state) do
    {:reply, Calculator._get(state), state}
  end

  def handle_call({:add, number}, _from, state) do
    {:reply, "Added #{number}", Calculator._add(state, number)}
  end

  def handle_call({:sub, number}, _from, state) do
    {:reply, "Substracted #{number}", Calculator._sub(state, number)}
  end

  def handle_call({:mul, number}, _from, state) do
    {:reply, "Multiplied by #{number}", Calculator._mul(state, number)}
  end

  def handle_call({:div, number}, _from, state) do
    {:reply, "Divided by #{number}", Calculator._div(state, number)}
  end

  # Functions
  def new do
    %Calculator{value: 0}
  end

  def _add(%Calculator{value: old_value}, number) do
    %Calculator{value: old_value + number}
  end

  def _sub(%Calculator{value: old_value}, number) do
    %Calculator{value: old_value - number}
  end

  def _mul(%Calculator{value: old_value}, number) do
    %Calculator{value: old_value * number}
  end

  def _div(%Calculator{value: old_value}, number) do
    %Calculator{value: old_value / number}
  end

  def _get(%Calculator{value: value}) do
    value
  end
end
# Process.register pid1, Calculator
# pid1 = Process.whereis(Calculator)
# Process.alive?(pid1)
