defmodule FizzBuzz do
  def build(file_name) do
    file_name
    |> File.read()
    |> handle_file
  end

  defp handle_file({:ok, result}) do
    result
    |> String.split(",") # Essa função recebe dois parametros, mas pelo pipe operator o primeiro é omitido
    |> Enum.map(&convert_and_evaluate/1)    
  end
  defp handle_file({:error, reason}), do: reason

  defp convert_and_evaluate(elem) do
    elem
    |> String.to_integer()
    |> evaluate_number()
  end

  defp evaluate_number(number) when rem(number, 3) == 0 and rem(number, 5) == 0, do: :FizzBuzz
  defp evaluate_number(number) when rem(number, 3) == 0, do: :Fizz
  defp evaluate_number(number) when rem(number, 5) == 0, do: :Buzz  
  defp evaluate_number(number), do: number
  
end
