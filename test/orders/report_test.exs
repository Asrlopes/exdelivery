defmodule Exdelivery.Orders.ReportTest do
  use ExUnit.Case

  import Exdelivery.Factory

  alias Exdelivery.Orders.Agent, as: OrderAgent
  alias Exdelivery.Orders.Report

  describe "create/1" do
    test "creates the report file" do
      OrderAgent.start_link(%{})

      :order
      |> build()
      |> OrderAgent.save()

      :order
      |> build()
      |> OrderAgent.save()

      Report.create("report_test.csv")

      response = File.read!("report_test.csv")

      expected_response =
        "12345678900,pizza,1,53japonesa,2,20.50,94.00\n" <>
          "12345678900,pizza,1,53japonesa,2,20.50,94.00\n"

      assert response == expected_response
    end
  end
end
