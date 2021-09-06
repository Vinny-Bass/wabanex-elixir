defmodule WabanexWeb.IMCControllerTest do
  use WabanexWeb.ConnCase, async: true

  describe "index/2" do
    test "when all params are valid return the imc info", %{conn: conn} do
      params = %{"filename" => "students.csv"}

      response =
        conn
        |> get(Routes.imc_path(conn, :index, params))
        |> json_response(:ok)

      expected_response = %{
        "result" => %{
          "Caio" => 29.4543063773833,
          "Eder" => 26.19618735008206,
          "Pamela" => 22.321428571428577,
          "Vinicius" => 25.50361570247934
        }
      }

      assert expected_response == response
    end
  end
end
