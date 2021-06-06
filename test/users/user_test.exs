defmodule ExdeliveryTest.Users.UserTest do
  use ExUnit.Case

  import Exdelivery.Factory

  alias Exdelivery.Users.User

  describe "build/5" do
    test "when all params are valid, returns the user" do
      response =
        User.build(
          "Avenida dos estados, 331",
          "junior",
          "junior@gmail.com",
          "12345678900",
          25
        )

      expected_response = {:ok, build(:user)}

      assert response == expected_response
    end

    test "when there are invalid params, returns an error" do
      response =
        User.build(
          "Rua dos teste",
          "Jhon Doo",
          "jhon@gmail.com",
          "123456789",
          17
        )

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end
end
