defmodule Calci.CalculatorTest do
  use ExUnit.Case
  alias Calci.Calculator

  test "add 100" do
  	calc = Calculator.new
  	new_calc = Calculator.add(calc, 100)

  	assert 100 == Calculator.get(new_calc)
  end
end