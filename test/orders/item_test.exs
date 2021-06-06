defmodule ExdeliveryTest.Oders.ItemTest do
  use ExUnit.Case

  import Exdelivery.Factory

  alias Exdelivery.Orders.Item

  describe "build/4" do
    test "when all params are valid, returns an item" do
      response = Item.build("pizza de strogonoff", :pizza, "53", 1)

      expected_response = {:ok, build(:item)}

      assert response == expected_response
    end

    test "when there is an invalid category, returns an error" do
      response = Item.build("pizza de strogonoff", :invalid_category, "53", 1)

      expected_response = {:error, "Invalid params"}

      assert response == expected_response
    end

    test "when there is an invalid price, returns an error" do
      response = Item.build("pizza de strogonoff", :pizza, "price", 1)

      expected_response = {:error, "Invalid price"}

      assert response == expected_response
    end

    test "when there is an invalid quantity, returns an error" do
      response = Item.build("pizza de strogonoff", :pizza, "53", 0)

      expected_response = {:error, "Invalid params"}

      assert response == expected_response
    end
  end
end
