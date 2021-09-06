defmodule WabanexWeb.SchemaTest do
  use WabanexWeb.ConnCase, async: true

  alias Wabanex.User

  describe "users queries" do
    test "when a valid id is given, returns the user", %{conn: conn} do
      params = %{email: "vinicius@teste.com", name: "Vinicius", password: "123456"}

      {:ok, %User{id: user_id}}  =Wabanex.User.Create.call(params)

      query = """
        {
          getUser(id: "#{user_id}") {
            id,
            email
          }
        }
      """

      response =
        conn
        |> post("/api/graphql", %{query: query})
        |> json_response(:ok)

      expected_response = %{
        "data" => %{
          "getUser" => %{
            "email" => "vinicius@teste.com",
            "id" => user_id
          }
        }
      }

      assert expected_response == response
    end
  end
end
