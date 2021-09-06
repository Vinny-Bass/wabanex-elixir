defmodule Wabanex.UserTest do
  use Wabanex.DataCase, async: true

  alias Wabanex.User

  describe "changeset/1" do
    test "When all params are valid, return a valid changeset" do
      params = %{name: "Vinicius Bass", email: "vinicius@teste.com", password: "123456"}

      response = User.changeset(params)

      assert %Ecto.Changeset{
        valid?: true,
        changes: %{name: "Vinicius Bass", email: "vinicius@teste.com", password: "123456"},
        errors: []
      } = response
    end

    test "When params are invalid, return the rigth errors" do
      params = %{name: "V", email: "vinicius@teste.com"}

      response = User.changeset(params)

      expected_response = %{
        name: ["should be at least 2 character(s)"],
        password: ["can't be blank"]
      }

      assert errors_on(response) == expected_response
    end
  end
end
