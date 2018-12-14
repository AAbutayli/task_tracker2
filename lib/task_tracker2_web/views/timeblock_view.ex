defmodule TaskTracker2Web.TimeblockView do
  use TaskTracker2Web, :view
  alias TaskTracker2Web.TimeblockView
  def render("index.json", %{timeblocks: timeblocks}) do
    %{data: render_many(timeblocks, TimeblockView, "timeblock.json")}
  end
  def render("show.json", %{timeblock: timeblock}) do
    %{data: render_one(timeblock, TimeblockView, "timeblock.json")}
  end
  def render("timeblock.json", %{timeblock: timeblock}) do
    %{id: timeblock.id,
      start: timeblock.start,
      end: timeblock.end}
  end
end
