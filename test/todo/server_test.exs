defmodule Todo.ServerTest do
  use ExUnit.Case

  alias Todo.Server

  test ".add_list adds a new supervised list" do
    Server.add_list("Home")
    Server.add_list("Work")

    counts = Supervisor.count_children(Server)

    assert counts.active == 2
  end

  test ".find_list gets a list by its name" do
    Server.add_list("find-by-name")
    list = Server.find_list("find-by-name")

    assert is_pid(list)
  end
end
