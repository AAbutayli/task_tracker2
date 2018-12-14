defmodule TaskTracker2Web.TimeblockController do
  use TaskTracker2Web, :controller

  alias TaskTracker2.Timeblocks
  alias TaskTracker2.Timeblocks.Timeblock

  action_fallback TaskTracker2Web.FallbackController

  def index(conn, _params) do
    timeblocks = Timeblocks.list_timeblocks()
    render(conn, "index.html", timeblocks: timeblocks)
  end

  def new(conn, _params) do
    changeset = Timeblocks.change_timeblock(%Timeblock{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"timeblock" => timeblock_params}) do
    with {:ok, %Timeblock{} = timeblock} <- Timeblocks.create_timeblock(timeblock_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.timeblock_path(conn, :show, timeblock))
      |> render("show.json", timeblock: timeblock)
    end
  end

  def show(conn, %{"id" => id}) do
    timeblock = Timeblocks.get_timeblock!(id)
    render(conn, "show.html", timeblock: timeblock)
  end

#  def edit(conn, %{"id" => id}) do
 #   timeblock = Timeblocks.get_timeblock!(id)
 #   with {:ok, %Timeblock{} = timeblock} <- Timeblocks.update_timeblock(timeblock, timeblock_params) do
  #    render(conn, "show.json", timeblock: timeblock)
   # end
  #end

  def update(conn, %{"id" => id, "timeblock" => timeblock_params}) do
    timeblock = Timeblocks.get_timeblock!(id)

    with {:ok, %Timeblock{} = timeblock} <- Timeblocks.update_timeblock(timeblock, timeblock_params) do
      render(conn, "show.json", timeblock: timeblock)
    #  {:error, %Ecto.Changeset{} = changeset} <- render(conn, "edit.html", timeblock: timeblock, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    timeblock = Timeblocks.get_timeblock!(id)
    with {:ok, %Timeblock{}} <- Timeblocks.delete_timeblock(timeblock) do
      send_resp(conn, :no_content, "")
    end
  end
end
