defmodule Vlogger.WatchController do
  use Vlogger.Web, :controller

  alias Vlogger.Video

  def show(conn, %{"id" => id}) do
    video = Repo.get!(Video, id)
    render conn, "show.html", video: video
  end
end