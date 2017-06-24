defmodule Vlogger.VideoChannel do
  use Vlogger.Web, :channel

  def join("videos:" <> video_id, _params, socket) do
    {:ok, socket}
  end

  def handle_in("new_annotation", params, socket) do
    broadcast! socket, "new_annotation", %{
      user: %{username: "ravi"},
      body: params["body"],
      at: params["at"]
    }

    {:reply, :ok, socket}
  end
end