defmodule Wabanex.IMCTest do
  use ExUnit.Case, async: true

  alias Wabanex.IMC

  describe "calculate/1" do
    test "When file exists, should return rigth calcs" do
      params = %{"filename" => "students.csv"}

      response = IMC.calculate(params)

      expected_response =
        {
          :ok,
          %{
            "Caio" => 29.4543063773833,
            "Eder" => 26.19618735008206,
            "Pamela" => 22.321428571428577,
            "Vinicius" => 25.50361570247934
          }
        }

      assert expected_response == response
    end

    test "When file do not exists, should return an error" do
      params = %{"filename" => "studentsssss.csv"}

      response = IMC.calculate(params)

      expected_response = {:error, "File not founded"}

      assert expected_response == response
    end
  end
end
