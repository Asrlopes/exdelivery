defmodule Exdelivery.Factory do
  use ExMachina

  alias Exdelivery.Orders.{Item, Order}
  alias Exdelivery.Users.User

  def user_factory do
    %User{
      name: "junior",
      email: "junior@gmail.com",
      cpf: "12345678900",
      age: 25,
      address: "Avenida dos estados, 331"
    }
  end

  def item_factory do
    %Item{
      description: "pizza de strogonoff",
      category: :pizza,
      unity_price: Decimal.new("53"),
      quantity: 1
    }
  end

  def order_factory do
    %Order{
      delivery_address: "Avenida dos estados, 331",
      items: [
        build(:item),
        build(:item,
          description: "Temaki de atum",
          category: :japonesa,
          quantity: 2,
          unity_price: Decimal.new("20.50")
        )
      ],
      total_price: Decimal.new("94.00"),
      user_cpf: "12345678900"
    }
  end
end
