defmodule Boombox.ElixirEndpointsTest do
  use ExUnit.Case, async: true

  alias Boombox.InternalBin.ElixirEndpoints

  test "rejects video dimensions that are not positive and even" do
    for options <- [
          [video_width: 641, video_height: 480],
          [video_width: 640, video_height: 0],
          [video_height: -2],
          [video_width: "640"]
        ] do
      assert_raise ArgumentError, ~r/Invalid value of the :video_\w+ option/, fn ->
        ElixirEndpoints.link_output(self(), options, :pull, %{}, [], false)
      end
    end
  end
end
